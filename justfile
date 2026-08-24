# Easy interface for the Surmount Systems site.
# `just` with no arguments lists recipes.

set default-list

# Apply the shared nav fragment, then serve on 127.0.0.1:8000 and open the default browser (`--nocache` is in the flake app).
serve:
    nix run path:.#build
    nix run path:.#serve

# Full quality gate: public-page nav, then Lean on the remote builder.
# --max-jobs 0 keeps compiles off this laptop. --cores 64 is the remote builder.
# Nix flags must precede the installable so `nix run` does not pass them to nav-ssg.
check:
    nix run --max-jobs 0 --cores 64 path:.#check
    nix build --max-jobs 0 --cores 64 --print-build-logs path:.?dir=lean
