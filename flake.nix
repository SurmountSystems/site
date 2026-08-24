{
  description = "Surmount Systems public site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Binary Rust toolchains. Pin 1.98.0; nixpkgs-unstable rustc was still 1.97.1.
    # https://blog.rust-lang.org/2026/08/20/Rust-1.98.0/ (accessed: 2026-08-24).
    # https://github.com/oxalica/rust-overlay (accessed: 2026-08-24).
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
    let
      inherit (nixpkgs) lib;
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
        };
      eachSystem = f: lib.genAttrs systems (system: f (pkgsFor system));

      rustToolchain = pkgs: pkgs.rust-bin.stable."1.98.0".minimal;

      siteTools =
        pkgs:
        let
          rust = rustToolchain pkgs;
          rustPlatform = pkgs.makeRustPlatform {
            cargo = rust;
            rustc = rust;
          };
        in
        {
          nav-ssg = rustPlatform.buildRustPackage {
            pname = "nav-ssg";
            version = "0.1.0";
            src = ./nav-ssg;
            cargoLock.lockFile = ./nav-ssg/Cargo.lock;
            doCheck = true;
            enableParallelBuilding = true;
            nativeBuildInputs = [ pkgs.makeWrapper ];
            postInstall = ''
              wrapProgram $out/bin/nav-ssg --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.simple-http-server ]}
              ln -s nav-ssg $out/bin/check
              ln -s nav-ssg $out/bin/build
              ln -s nav-ssg $out/bin/serve
            '';
          };
        };
    in
    {
      packages = eachSystem (
        pkgs:
        let
          t = siteTools pkgs;
        in
        {
          inherit (t) nav-ssg;
          serve = t.nav-ssg;
          default = t.nav-ssg;
        }
      );

      apps = eachSystem (
        pkgs:
        let
          p = self.packages.${pkgs.stdenv.hostPlatform.system};
        in
        {
          default = {
            type = "app";
            program = "${p.nav-ssg}/bin/nav-ssg";
          };
          nav-ssg = {
            type = "app";
            program = "${p.nav-ssg}/bin/nav-ssg";
          };
          check = {
            type = "app";
            program = "${p.nav-ssg}/bin/check";
          };
          build = {
            type = "app";
            program = "${p.nav-ssg}/bin/build";
          };
          serve = {
            type = "app";
            program = "${p.nav-ssg}/bin/serve";
          };
        }
      );

      devShells = eachSystem (
        pkgs:
        let
          t = siteTools pkgs;
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.just
              pkgs.simple-http-server
              t.nav-ssg
            ];
          };
        }
      );
    };
}
