use std::env;
use std::ffi::OsStr;
use std::path::Path;
use std::process::ExitCode;

fn usage() -> ExitCode {
    eprintln!("usage: nav-ssg check | nav-ssg apply | nav-ssg serve");
    ExitCode::from(2)
}

fn command_from_args() -> Option<String> {
    let mut args = env::args();
    let argv0 = args.next().unwrap_or_default();
    let name = Path::new(&argv0)
        .file_name()
        .and_then(OsStr::to_str)
        .unwrap_or("");
    match name {
        "check" | "build" | "serve" => Some(name.to_string()),
        _ => args.next(),
    }
}

fn main() -> ExitCode {
    match command_from_args().as_deref() {
        Some("check") => nav_ssg::run_check(),
        Some("apply") | Some("build") => nav_ssg::run_apply(),
        Some("serve") => nav_ssg::run_serve(),
        _ => usage(),
    }
}
