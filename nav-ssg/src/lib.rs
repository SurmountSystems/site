//! Check or apply `shared/nav.html` on the public pages.
//!
//! Page list is every `href="*.html"` in the fragment, in order, unique.

use std::env;
use std::fmt;
use std::fs;
use std::io::{self, Write};
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr, SocketAddr, SocketAddrV4, TcpListener};
use std::path::{Path, PathBuf};
use std::process::{Command, ExitCode, Stdio};

#[cfg(unix)]
use std::os::unix::process::CommandExt;

const FRAGMENT_REL: &str = "shared/nav.html";

pub fn site_root() -> io::Result<PathBuf> {
    match env::var_os("NAV_SSG_ROOT") {
        Some(p) => Ok(PathBuf::from(p)),
        None => env::current_dir(),
    }
}

pub fn pages_from_nav(fragment: &str) -> Vec<String> {
    let mut pages = Vec::new();
    let mut rest = fragment;
    while let Some(i) = rest.find("href=\"") {
        rest = &rest[i + 6..];
        let Some(end) = rest.find('"') else { break };
        let href = &rest[..end];
        rest = &rest[end + 1..];
        if href.ends_with(".html") && !pages.iter().any(|p| p == href) {
            pages.push(href.to_string());
        }
    }
    pages
}

pub fn with_aria_current(fragment: &str, page: &str) -> String {
    let from = format!("<a href=\"{page}\">");
    let to = format!("<a href=\"{page}\" aria-current=\"page\">");
    fragment.replacen(&from, &to, 1)
}

/// Whole lines from the line containing `<nav>` through the line containing `</nav>`.
pub fn extract_nav(html: &str) -> Option<String> {
    let mut result = String::new();
    let mut printing = false;
    for line in html.split_inclusive('\n') {
        if line.contains("<nav>") {
            printing = true;
        }
        if printing {
            result.push_str(line);
        }
        if printing && line.contains("</nav>") {
            return Some(result);
        }
    }
    None
}

pub fn replace_nav(html: &str, new_nav: &str) -> Option<String> {
    let mut out = String::new();
    let mut skip = false;
    let mut done = false;
    let mut found = false;
    for line in html.split_inclusive('\n') {
        if !done && line.contains("<nav>") {
            found = true;
            out.push_str(new_nav);
            skip = true;
            done = true;
            if line.contains("</nav>") {
                skip = false;
            }
            continue;
        }
        if skip && line.contains("</nav>") {
            skip = false;
            continue;
        }
        if !skip {
            out.push_str(line);
        }
    }
    if found && !skip { Some(out) } else { None }
}

pub fn line_diff(expected: &str, actual: &str, expected_name: &str, actual_name: &str) -> String {
    let mut s = format!("--- {expected_name}\n+++ {actual_name}\n");
    let e: Vec<&str> = expected.lines().collect();
    let a: Vec<&str> = actual.lines().collect();
    let n = e.len().max(a.len());
    for i in 0..n {
        match (e.get(i), a.get(i)) {
            (Some(x), Some(y)) if x == y => {}
            (Some(x), Some(y)) => {
                s.push_str(&format!("-{x}\n+{y}\n"));
            }
            (Some(x), None) => s.push_str(&format!("-{x}\n")),
            (None, Some(y)) => s.push_str(&format!("+{y}\n")),
            (None, None) => {}
        }
    }
    if expected == actual { String::new() } else { s }
}

fn load_fragment(root: &Path) -> Result<String, (u8, String)> {
    let path = root.join(FRAGMENT_REL);
    match fs::read_to_string(&path) {
        Ok(s) if s.is_empty() => Err((2, "nav-ssg: shared/nav.html is empty.".into())),
        Ok(s) => Ok(s),
        Err(_) => Err((
            2,
            "nav-ssg: shared/nav.html not found. Run from the site root.".into(),
        )),
    }
}

fn expected_nav(fragment: &str, page: &str) -> String {
    with_aria_current(fragment, page)
}

pub fn run_check() -> ExitCode {
    match site_root() {
        Ok(root) => run_check_at(&root),
        Err(_) => ExitCode::from(2),
    }
}

pub fn run_check_at(root: &Path) -> ExitCode {
    match run_check_inner(root) {
        Ok(()) => ExitCode::SUCCESS,
        Err(code) => ExitCode::from(code),
    }
}

fn run_check_inner(root: &Path) -> Result<(), u8> {
    let fragment = match load_fragment(root) {
        Ok(s) => s,
        Err((code, msg)) => {
            eprintln!("{msg}");
            return Err(code);
        }
    };
    let pages = pages_from_nav(&fragment);
    if pages.is_empty() {
        eprintln!("nav-ssg: shared/nav.html has no href=\"*.html\" pages.");
        return Err(2);
    }
    let mut status: u8 = 0;
    for page in pages {
        let path = root.join(&page);
        if !path.is_file() {
            eprintln!("nav-ssg: missing {page}");
            status = 1;
            continue;
        }
        let html = match fs::read_to_string(&path) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("nav-ssg: {page}: {e}");
                status = 1;
                continue;
            }
        };
        if !html.contains("<nav>") {
            eprintln!("nav-ssg: {page} has no <nav>");
            status = 1;
            continue;
        }
        let expected = expected_nav(&fragment, &page);
        let Some(actual) = extract_nav(&html) else {
            eprintln!("nav-ssg: {page} has no <nav>");
            status = 1;
            continue;
        };
        if expected == actual {
            continue;
        }
        let diff = line_diff(&expected, &actual, "expected", &format!("{page} nav"));
        let _ = io::stdout().write_all(diff.as_bytes());
        eprintln!("nav-ssg: {page} nav drifted");
        status = 1;
    }
    if status == 0 { Ok(()) } else { Err(status) }
}

pub fn run_apply() -> ExitCode {
    match site_root() {
        Ok(root) => run_apply_at(&root),
        Err(_) => ExitCode::from(2),
    }
}

pub fn run_apply_at(root: &Path) -> ExitCode {
    match run_apply_inner(root) {
        Ok(()) => ExitCode::SUCCESS,
        Err(code) => ExitCode::from(code),
    }
}

fn run_apply_inner(root: &Path) -> Result<(), u8> {
    let fragment = match load_fragment(root) {
        Ok(s) => s,
        Err((code, msg)) => {
            eprintln!("{msg}");
            return Err(code);
        }
    };
    let pages = pages_from_nav(&fragment);
    if pages.is_empty() {
        eprintln!("nav-ssg: shared/nav.html has no href=\"*.html\" pages.");
        return Err(2);
    }
    for page in pages {
        let path = root.join(&page);
        if !path.is_file() {
            eprintln!("nav-ssg: missing {page}");
            return Err(1);
        }
        let html = fs::read_to_string(&path).map_err(|e| {
            eprintln!("nav-ssg: {page}: {e}");
            1u8
        })?;
        if !html.contains("<nav>") {
            eprintln!("nav-ssg: {page} has no <nav>");
            return Err(1);
        }
        let expected = expected_nav(&fragment, &page);
        let rebuilt = match replace_nav(&html, &expected) {
            Some(s) => s,
            None => {
                eprintln!("nav-ssg: {page} has no <nav>");
                return Err(1);
            }
        };
        if html == rebuilt {
            println!("nav-ssg: {page} already current");
            continue;
        }
        fs::write(&path, rebuilt).map_err(|e| {
            eprintln!("nav-ssg: {page}: {e}");
            1u8
        })?;
        println!("nav-ssg: applied {page}");
    }
    Ok(())
}

/// Listen address for `serve`. `simple-http-server` default port is 8000 (no `--port` in argv).
pub const SERVE_LISTEN: SocketAddr = SocketAddr::V4(SocketAddrV4::new(Ipv4Addr::LOCALHOST, 8000));

/// `simple-http-server` argv for `serve`: same flags as the former flake app.
pub fn serve_command_argv() -> Vec<String> {
    vec![
        "simple-http-server".to_string(),
        "--ip".to_string(),
        "127.0.0.1".to_string(),
        "--index".to_string(),
        "--nocache".to_string(),
        "--open".to_string(),
        ".".to_string(),
    ]
}

/// Bind failed because the address is already in use. The product does not kill the occupant.
#[derive(Debug)]
pub struct ServePreflightError {
    pub addr: SocketAddr,
    pub pid: Option<u32>,
    pub comm: Option<String>,
    pub cwd: Option<PathBuf>,
}

impl fmt::Display for ServePreflightError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        writeln!(f, "nav-ssg: {} is already in use.", self.addr)?;
        match (self.pid, self.comm.as_deref()) {
            (Some(pid), Some(comm)) => {
                writeln!(f, "The occupant is PID {pid} ({comm}).")?;
            }
            (Some(pid), None) => writeln!(f, "The occupant is PID {pid}.")?,
            (None, _) => {
                writeln!(f, "The occupant process could not be read from /proc.")?;
            }
        }
        if let Some(cwd) = &self.cwd {
            writeln!(f, "Its working directory is {}.", cwd.display())?;
        }
        write!(
            f,
            "This is usually a leftover just serve or simple-http-server. Stop that process, then run just serve again."
        )
    }
}

/// Probe `addr`. Ok means serve may exec. Does not kill whoever holds the port.
pub fn preflight_listen(addr: SocketAddr) -> Result<(), ServePreflightError> {
    match TcpListener::bind(addr) {
        Ok(_listener) => Ok(()),
        Err(e) if e.kind() == io::ErrorKind::AddrInUse => Err(occupant_error(addr)),
        Err(_) => Ok(()),
    }
}

fn occupant_error(addr: SocketAddr) -> ServePreflightError {
    let pid = occupying_pid(addr);
    let (comm, cwd) = match pid {
        Some(pid) => (read_comm(pid), read_cwd(pid)),
        None => (None, None),
    };
    ServePreflightError {
        addr,
        pid,
        comm,
        cwd,
    }
}

fn read_comm(pid: u32) -> Option<String> {
    let s = fs::read_to_string(format!("/proc/{pid}/comm")).ok()?;
    let trimmed = s.trim();
    if trimmed.is_empty() {
        None
    } else {
        Some(trimmed.to_string())
    }
}

fn read_cwd(pid: u32) -> Option<PathBuf> {
    fs::read_link(format!("/proc/{pid}/cwd")).ok()
}

fn occupying_pid(addr: SocketAddr) -> Option<u32> {
    for inode in occupying_listen_inodes(addr) {
        if let Some(pid) = pid_with_socket_inode(inode) {
            return Some(pid);
        }
    }
    None
}

fn occupying_listen_inodes(addr: SocketAddr) -> Vec<u64> {
    let mut inodes = Vec::new();
    append_listen_inodes("/proc/net/tcp", addr, false, &mut inodes);
    append_listen_inodes("/proc/net/tcp6", addr, true, &mut inodes);
    inodes
}

fn append_listen_inodes(path: &str, wanted: SocketAddr, ipv6: bool, out: &mut Vec<u64>) {
    let Ok(text) = fs::read_to_string(path) else {
        return;
    };
    for line in text.lines().skip(1) {
        let mut cols = line.split_whitespace();
        let _sl = cols.next();
        let Some(local) = cols.next() else { continue };
        let Some(_rem) = cols.next() else { continue };
        let Some(st) = cols.next() else { continue };
        if !st.eq_ignore_ascii_case("0A") {
            continue;
        }
        let Some(_tx) = cols.next() else { continue };
        let Some(_tr) = cols.next() else { continue };
        let Some(_retr) = cols.next() else { continue };
        let Some(_uid) = cols.next() else { continue };
        let Some(_timeout) = cols.next() else {
            continue;
        };
        let Some(inode_s) = cols.next() else { continue };
        let Ok(inode) = inode_s.parse::<u64>() else {
            continue;
        };
        if inode == 0 {
            continue;
        }
        let Some(bound) = parse_proc_net_local(local, ipv6) else {
            continue;
        };
        if listen_occupies(bound, wanted) {
            out.push(inode);
        }
    }
}

fn listen_occupies(bound: SocketAddr, wanted: SocketAddr) -> bool {
    if bound.port() != wanted.port() {
        return false;
    }
    if bound.ip() == wanted.ip() {
        return true;
    }
    match bound.ip() {
        IpAddr::V4(ip) if ip.is_unspecified() && wanted.is_ipv4() => true,
        IpAddr::V6(ip) if ip.is_unspecified() => true,
        _ => false,
    }
}

fn parse_proc_net_local(s: &str, ipv6: bool) -> Option<SocketAddr> {
    let (ip_hex, port_hex) = s.split_once(':')?;
    let port = u16::from_str_radix(port_hex, 16).ok()?;
    if ipv6 {
        if ip_hex.len() != 32 {
            return None;
        }
        let mut bytes = [0u8; 16];
        for i in 0..4 {
            let word = u32::from_str_radix(&ip_hex[i * 8..i * 8 + 8], 16).ok()?;
            let le = word.to_le_bytes();
            bytes[i * 4..i * 4 + 4].copy_from_slice(&le);
        }
        Some(SocketAddr::from((Ipv6Addr::from(bytes), port)))
    } else {
        if ip_hex.len() != 8 {
            return None;
        }
        let n = u32::from_str_radix(ip_hex, 16).ok()?;
        let ip = Ipv4Addr::new(
            (n & 0xff) as u8,
            ((n >> 8) & 0xff) as u8,
            ((n >> 16) & 0xff) as u8,
            ((n >> 24) & 0xff) as u8,
        );
        Some(SocketAddr::from((ip, port)))
    }
}

fn pid_with_socket_inode(inode: u64) -> Option<u32> {
    let want = format!("socket:[{inode}]");
    let proc_dir = fs::read_dir("/proc").ok()?;
    for entry in proc_dir.flatten() {
        let name = entry.file_name();
        let Some(name) = name.to_str() else { continue };
        let Ok(pid) = name.parse::<u32>() else {
            continue;
        };
        let fd_dir = entry.path().join("fd");
        let Ok(fds) = fs::read_dir(fd_dir) else {
            continue;
        };
        for fd in fds.flatten() {
            let Ok(target) = fs::read_link(fd.path()) else {
                continue;
            };
            if target.to_str() == Some(want.as_str()) {
                return Some(pid);
            }
        }
    }
    None
}

fn serve_command() -> Command {
    let argv = serve_command_argv();
    let mut cmd = Command::new(&argv[0]);
    cmd.args(&argv[1..]);
    cmd.stdin(Stdio::inherit());
    cmd.stdout(Stdio::inherit());
    cmd.stderr(Stdio::inherit());
    cmd
}

/// If `addr` is free, return the serve command. If it is in use, do not exec.
pub fn serve_command_if_listen_free(addr: SocketAddr) -> Result<Command, ServePreflightError> {
    preflight_listen(addr)?;
    Ok(serve_command())
}

/// Run `simple-http-server` in the process current directory (site root the user ran from).
pub fn run_serve() -> ExitCode {
    let mut cmd = match serve_command_if_listen_free(SERVE_LISTEN) {
        Ok(cmd) => cmd,
        Err(err) => {
            eprintln!("{err}");
            return ExitCode::from(1);
        }
    };
    #[cfg(unix)]
    {
        let err = cmd.exec();
        eprintln!("nav-ssg: failed to run simple-http-server: {err}");
        ExitCode::from(2)
    }
    #[cfg(not(unix))]
    {
        match cmd.status() {
            Ok(status) => match status.code() {
                Some(code) => ExitCode::from(code as u8),
                None => ExitCode::from(1),
            },
            Err(e) => {
                eprintln!("nav-ssg: failed to run simple-http-server: {e}");
                ExitCode::from(2)
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs;
    use std::net::TcpListener;
    use std::time::{SystemTime, UNIX_EPOCH};

    const FRAGMENT: &str = "      <nav>\n        <ul>\n          <li><a href=\"index.html\">Home</a></li>\n          <li><a href=\"faith.html\">Faith</a></li>\n        </ul>\n      </nav>\n";

    const NESTED: &str = "      <nav>\n        <ul>\n          <li><a href=\"index.html\">Home</a></li>\n          <li>\n            <a href=\"philosophy.html\">Philosophy</a>\n            <ul>\n              <li><a href=\"faith.html\">Faith</a></li>\n              <li><a href=\"vocabulary.html\">Vocabulary</a></li>\n            </ul>\n          </li>\n        </ul>\n      </nav>\n";

    #[test]
    fn pages_from_nav_unique_html_hrefs_in_order() {
        let pages = pages_from_nav(FRAGMENT);
        assert_eq!(
            pages,
            vec!["index.html".to_string(), "faith.html".to_string()]
        );
    }

    #[test]
    fn aria_current_on_matching_href_only() {
        let out = with_aria_current(FRAGMENT, "faith.html");
        assert!(out.contains("<a href=\"faith.html\" aria-current=\"page\">Faith</a>"));
        assert!(out.contains("<a href=\"index.html\">Home</a>"));
        assert!(!out.contains("<a href=\"index.html\" aria-current=\"page\">"));
    }

    #[test]
    fn pages_from_nav_nested_hrefs_end_with_html_no_query() {
        let pages = pages_from_nav(NESTED);
        assert_eq!(
            pages,
            vec![
                "index.html".to_string(),
                "philosophy.html".to_string(),
                "faith.html".to_string(),
                "vocabulary.html".to_string(),
            ]
        );
        for page in &pages {
            assert!(page.ends_with(".html"), "{page}");
            assert!(!page.contains('?'), "{page}");
        }
    }

    #[test]
    fn aria_current_on_nested_child_page() {
        let out = with_aria_current(NESTED, "faith.html");
        assert!(out.contains("<a href=\"faith.html\" aria-current=\"page\">Faith</a>"));
        assert!(out.contains("<a href=\"philosophy.html\">Philosophy</a>"));
        assert!(!out.contains("<a href=\"philosophy.html\" aria-current=\"page\">"));
        assert!(!out.contains("<a href=\"vocabulary.html\" aria-current=\"page\">"));
    }

    #[test]
    fn aria_current_on_section_parent_page() {
        let out = with_aria_current(NESTED, "philosophy.html");
        assert!(out.contains("<a href=\"philosophy.html\" aria-current=\"page\">Philosophy</a>"));
        assert!(out.contains("<a href=\"faith.html\">Faith</a>"));
        assert!(!out.contains("<a href=\"faith.html\" aria-current=\"page\">"));
    }

    #[test]
    fn extract_nav_keeps_line_indent() {
        let page = "<header>\n      <nav>\n        <ul></ul>\n      </nav>\n</header>\n";
        let nav = extract_nav(page).unwrap();
        assert_eq!(nav, "      <nav>\n        <ul></ul>\n      </nav>\n");
    }

    #[test]
    fn replace_nav_swaps_only_the_nav_block() {
        let page = "<body>\n      <nav>\n        old\n      </nav>\n      <main></main>\n</body>\n";
        let new_nav = "      <nav>\n        new\n      </nav>\n";
        let out = replace_nav(page, new_nav).unwrap();
        assert_eq!(
            out,
            "<body>\n      <nav>\n        new\n      </nav>\n      <main></main>\n</body>\n"
        );
    }

    #[test]
    fn line_diff_empty_when_equal() {
        assert_eq!(line_diff("a\n", "a\n", "e", "a"), "");
    }

    #[test]
    fn line_diff_shows_mismatch() {
        let d = line_diff("foo\n", "bar\n", "expected", "actual");
        assert!(d.contains("--- expected"));
        assert!(d.contains("+++ actual"));
        assert!(d.contains("-foo"));
        assert!(d.contains("+bar"));
    }

    fn temp_site() -> PathBuf {
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_nanos();
        let dir = env::temp_dir().join(format!("nav-ssg-test-{nanos}"));
        fs::create_dir_all(dir.join("shared")).unwrap();
        dir
    }

    #[test]
    fn check_mismatch_is_nonzero() {
        let dir = temp_site();
        fs::write(dir.join("shared/nav.html"), FRAGMENT).unwrap();
        fs::write(dir.join("index.html"), "<nav>\n  wrong\n</nav>\n").unwrap();
        fs::write(
            dir.join("faith.html"),
            &with_aria_current(FRAGMENT, "faith.html"),
        )
        .unwrap();
        let code = run_check_at(&dir);
        let _ = fs::remove_dir_all(&dir);
        assert_ne!(code, ExitCode::SUCCESS);
    }

    #[test]
    fn serve_argv_includes_nocache_and_site_flags() {
        let argv = serve_command_argv();
        let args: Vec<&str> = argv.iter().map(|s| s.as_str()).collect();
        assert_eq!(
            args,
            [
                "simple-http-server",
                "--ip",
                "127.0.0.1",
                "--index",
                "--nocache",
                "--open",
                ".",
            ]
        );
        assert!(args.contains(&"--nocache"));
    }

    #[test]
    fn serve_listen_is_127_0_0_1_port_8000() {
        assert_eq!(SERVE_LISTEN, "127.0.0.1:8000".parse().unwrap());
    }

    #[test]
    fn preflight_error_for_production_port_mentions_8000_and_pid() {
        let err = ServePreflightError {
            addr: SERVE_LISTEN,
            pid: Some(4242),
            comm: Some("simple-http-server".to_string()),
            cwd: None,
        };
        let msg = err.to_string();
        assert!(
            msg.contains("8000"),
            "message must contain 8000, got: {msg}"
        );
        assert!(
            msg.contains("4242"),
            "message must contain the PID, got: {msg}"
        );
        assert!(
            msg.contains("already in use"),
            "message must say the address is in use, got: {msg}"
        );
    }

    #[test]
    fn preflight_listen_reports_occupant_pid_when_address_in_use() {
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind ephemeral loopback");
        let addr = listener.local_addr().expect("local addr");
        let err = match serve_command_if_listen_free(addr) {
            Ok(_) => panic!("preflight must not allow exec when the address is in use"),
            Err(e) => e,
        };
        let msg = err.to_string();
        assert!(
            msg.contains(&addr.port().to_string()),
            "message must contain the port, got: {msg}"
        );
        assert!(
            msg.contains(&std::process::id().to_string()),
            "message must contain occupant PID, got: {msg}"
        );
        drop(listener);
    }

    #[test]
    fn apply_rewrites_drifted_nav() {
        let dir = temp_site();
        fs::write(dir.join("shared/nav.html"), FRAGMENT).unwrap();
        fs::write(
            dir.join("index.html"),
            "<html>\n      <nav>\n        old\n      </nav>\n</html>\n",
        )
        .unwrap();
        fs::write(
            dir.join("faith.html"),
            "<html>\n      <nav>\n        old\n      </nav>\n</html>\n",
        )
        .unwrap();
        let code = run_apply_at(&dir);
        assert_eq!(code, ExitCode::SUCCESS);
        let index = fs::read_to_string(dir.join("index.html")).unwrap();
        assert!(index.contains("aria-current=\"page\""));
        assert!(index.contains("<a href=\"index.html\" aria-current=\"page\">"));
        assert!(index.contains("<html>"));
        let _ = fs::remove_dir_all(&dir);
    }
}
