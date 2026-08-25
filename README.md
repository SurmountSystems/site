# Surmount Systems

This is the public website at [surmount.systems](https://surmount.systems/).
Original work is in the public domain. See [UNLICENSE.md](UNLICENSE.md) and
[unlicense.org](https://unlicense.org/) (accessed: 2026-08-19).

The pages are unminified HTML at the repository root, with `styles.css`,
`nav.js`, fonts, and favicons. Color is DOGE only: the eight pure 3-bit RGB
colors in [0001_DOGE.md](https://github.com/SurmountSystems/specs/blob/main/0001_DOGE.md)
(accessed: 2026-08-14). There are no public email addresses and no `mailto:`
links.

## How to work on the site

`just` with no arguments lists recipes.

| Recipe | What it does |
|--------|----------------|
| `just serve` | Write the shared nav fragment onto every public page, then serve the working tree on 127.0.0.1 and open a browser (`--nocache` is already in the flake app). |
| `just check` | Full local and CI gate: public-page nav from `shared/nav.html`, then Lean on the remote builder. |

After you change navigation, run `just check`, then `just serve` (serve applies
the fragment). CI runs `just check`.

Public pages are the `href="*.html"` links in `shared/nav.html`. To add a page,
add that link, add the HTML file at the repository root, then check and serve.

## Two flakes

Do not add a third.

1. Site flake at the repository root: Rust `nav-ssg` (`nav-ssg/`), `check`,
   `build`, and `serve`.
2. Lean flake at `lean/flake.nix`: Holy Lean, Douay-Rheims quotations, the
   public-copy model (`SiteConsistency`), site-nav proofs (`SiteNav`),
   public-link proofs (`SiteLinks`), and the Grokipedia public-source spec.

`just check` runs `nix run --max-jobs 0 --cores 64 path:.#check`, then
`nix build --max-jobs 0 --cores 64 --print-build-logs path:.?dir=lean`. Lean is
part of `just check`. Compiles stay on the remote builder (`--max-jobs 0`).
`--cores 64` is that builder. GitHub Actions runs that same recipe after it
configures that builder from Actions secrets (`SURMOUNT_NIXBUILDER_SSH_KEY`,
`SURMOUNT_NIXBUILDER_KNOWN_HOSTS`, `SURMOUNT_NIX_BUILDERS`; organization
secrets preferred). There is no `just prove` recipe. `just serve`
runs `nix run path:.#build`, then `nix run path:.#serve`. The site flake pins
Rust 1.98.0 for nav-ssg.

## Scripture

Quoted scripture is the Original Douay-Rheims in the
`original-douay-rheims/` submodule (`bible/raw`). Old Testament: English
College of Douay, 1609. New Testament: English College of Rheims, 1582.
Dataset: [cryptoquick/original-douay-rheims](https://github.com/cryptoquick/original-douay-rheims)
(accessed: 2026-08-19). That is the unmodified historic translation, not
Challoner and not King James.

Quoted spelling stays as printed. Surrounding prose is American English.

## Vocabulary and Holy Lean

Load-bearing words live on [vocabulary.html](vocabulary.html). Encoded
definitions live in `lean/HolyLean.lean`. Quoted Douay-Rheims strings and the
warrant type (`oneVerse` or `versePair`) live in `lean/DouayRheims.lean`. The
three one-verse terms still have a term-to-citation isomorphism as a fragment.
The public-copy model is `lean/SiteConsistency.lean`. Those libraries do not
prove that God exists. They prove that the encoded claims do not contradict.

HTML is the citation source of truth. Wikipedia is not a public source and is
not printed on the pages. To extend the model, pick one path:

1. Printed verse: `def`, `site_*`, and `site_*_eq_source` `rfl` in
   `DouayRheims.lean`. Not a new warrant.
2. One-verse warrant: `Warrant.oneVerse` plus the three-term Iso fragment.
3. Pair warrant: `Warrant.versePair`. Do not force it into the Iso. Humility
   is Matthew 11:29 and Philippians 2:3.
4. Site claim: `SiteCopy` + `WellFormed` + `assertedCopy` + `rfl`. Vocabulary
   claims also go on Holy Lean.
