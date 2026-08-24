{
  description = "Surmount Systems public-copy consistency (Lean 4)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Binary toolchain overlay. Manifests on this input stop at v4.32.0 as of
    # 2026-08-19; v4.33.0 hashes are inlined below and fed to readBinaryToolchain.
    # See https://github.com/lenianiva/lean4-nix (accessed: 2026-08-19).
    lean4-nix.url = "github:lenianiva/lean4-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      lean4-nix,
    }:
    let
      inherit (nixpkgs) lib;
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      eachSystem = f: lib.genAttrs systems (system: f system);

      # Official Lean 4.33.0 release. Not an RC.
      # https://github.com/leanprover/lean4/releases/tag/v4.33.0 (accessed: 2026-08-19).
      v432 = import "${lean4-nix}/manifests/v4.32.0.nix";
      manifest = {
        tag = "v4.33.0";
        rev = "d8b18978322de05a8f3dba51ef03cf5461676c17";
        toolchain = {
          aarch64-linux = {
            url = "https://github.com/leanprover/lean4/releases/download/v4.33.0/lean-4.33.0-linux_aarch64.tar.zst";
            hash = "sha256-+WGkF8uhC26gqdE2cS1ZUoE4F//WaABB8JojNSb4A6k=";
          };
          x86_64-linux = {
            url = "https://github.com/leanprover/lean4/releases/download/v4.33.0/lean-4.33.0-linux.tar.zst";
            hash = "sha256-Sz+wPCmh4KJT+x0R+brjcl8ZoNxvwJs+oW0snfM0niw=";
          };
          x86_64-darwin = {
            url = "https://github.com/leanprover/lean4/releases/download/v4.33.0/lean-4.33.0-darwin.tar.zst";
            hash = "sha256-GMSt/S5FOMNmj34HDojHohV23un730beffLvFsl//vM=";
          };
          aarch64-darwin = {
            url = "https://github.com/leanprover/lean4/releases/download/v4.33.0/lean-4.33.0-darwin_aarch64.tar.zst";
            hash = "sha256-21J0tmm+JwrwSLXk8eDOVx32dQ5BGVaz4eb8wgEkEMI=";
          };
        };
        inherit (v432) overlay bootstrap buildLeanPackage;
      };
    in
    {
      packages = eachSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          # lean4-nix flake outputs do not export readBinaryToolchain. The
          # toolchain helper still accepts a v4.33.0 binary manifest.
          lean = (pkgs.callPackage "${lean4-nix}/lib/toolchain.nix" { }).fetchBinaryLean manifest;
          # Site root so SiteNav, SiteLinks, and Grokipedia can `include_str` pages.
          # Evaluate this flake as `path:.?dir=lean` from the site root so the
          # git tree includes parent HTML. `path:./lean` copies only `lean/`.
          src = lib.fileset.toSource {
            root = ../.;
            fileset = lib.fileset.unions [
              ./DouayRheims.lean
              ./HolyLean.lean
              ./SiteConsistency.lean
              ./SiteNav.lean
              ./SiteLinks.lean
              ./Grokipedia.lean
              ./lakefile.toml
              ./lean-toolchain
              ./lake-manifest.json
              ../index.html
              ../philosophy.html
              ../faith.html
              ../vocabulary.html
              ../projects.html
              ../contributors.html
              ../support.html
              ../contact.html
              ../shared/nav.html
            ];
          };
          prove = pkgs.stdenv.mkDerivation {
            pname = "surmount-site-consistency";
            version = "0.1.0";
            inherit src;
            nativeBuildInputs = [ lean.lean-all ];
            requiredSystemFeatures = [
              "big-parallel"
              "surmount-remote"
            ];
            preferLocalBuild = false;
            enableParallelBuilding = true;
            buildPhase = ''
              runHook preBuild
              # Lake 5 has no -j. Lean's thread pool is LEAN_NUM_THREADS;
              # enableParallelBuilding plus --cores sets NIX_BUILD_CORES (nproc).
              export LEAN_NUM_THREADS="$NIX_BUILD_CORES"
              # Fileset root is the site; lakefile and include_str live under lean/.
              cd lean
              lake build
              runHook postBuild
            '';
            installPhase = ''
              runHook preInstall
              mkdir -p $out
              echo "lake build ok" > $out/ok
              runHook postInstall
            '';
          };
        in
        {
          default = prove;
          inherit prove;
        }
      );
    };
}
