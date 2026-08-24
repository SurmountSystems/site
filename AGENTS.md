# Agent notes for the Surmount Systems site

This repository is the public site at [surmount.systems](https://surmount.systems/).
Original work is released into the public domain. See [UNLICENSE.md](UNLICENSE.md)
and [unlicense.org](https://unlicense.org/) (accessed: 2026-08-19).

## What this tree is

The public pages are unminified HTML at the repository root, plus `styles.css`,
`nav.js`, fonts, and favicons. Color is DOGE only: the eight pure 3-bit RGB
colors in [0001_DOGE.md](https://github.com/SurmountSystems/specs/blob/main/0001_DOGE.md)
(accessed: 2026-08-14). Do not minify. Do not put public email addresses or
`mailto:` links on the pages.

Visitor copy is American English and says **proven**. Public HTML `proved` stays
zero. Lean identifiers may still use `proved` (`provedTheism` and the like).

There are two Nix flakes. Do not add a third.

1. Site flake at the repository root (`flake.nix`): Rust `nav-ssg`, `check`,
   `build`, and `serve`.
2. Lean flake at `lean/flake.nix`: typecheck Holy Lean, Douay-Rheims
   isomorphisms, the public-copy consistency library, the site-nav
   well-formedness proofs, the public-link well-formedness proofs, and
   the Grokipedia public-source spec.

Do not add bash or Python flake glue. Do not write `.sh` novels for nav.

`just` with no arguments lists recipes. `serve` and `check` are thin wrappers
around those flakes. Two flakes only. `just serve` is `nix run path:.#build`
then `nix run path:.#serve` (`--nocache` is already in the flake app). Root
flake apps `build`, `serve`, and `check` stay (nav-ssg argv0). There is no
`just build` or `just prove` recipe.

`just check` is the full local and CI quality gate. It runs nav-ssg public-page
check (`nix run --max-jobs 0 --cores 64 path:.#check`), then Lean on the remote
builder (`nix build --max-jobs 0 --cores 64 --print-build-logs path:.?dir=lean`).
`path:.?dir=lean` is the Lean flake with the site tree so `include_str` can see the public HTML.
`path:./lean` copies only `lean/` and cannot include parent pages.
`--max-jobs 0` keeps compiles off this laptop. `--cores 64` is the remote
builder. Nix flags must precede the installable so `nix run` does not pass them
to nav-ssg. GitHub Actions invokes that same recipe. Lean is part of
`just check`. After this gate is green you do not need a separate Lean recipe
to know Lean passed. The site flake pins Rust 1.98.0 for nav-ssg via
rust-overlay.

After you change navigation, update the Lean nav model so it still matches
`shared/nav.html`, run `just check` (must be green), then `just serve`
so every public page receives the shared fragment from `shared/nav.html` (serve
applies the fragment, then serves). Public pages are the `href="*.html"` entries
in `shared/nav.html`. To add a page, add the link in `shared/nav.html`, add the
HTML file at the repository root, extend the Lean nav tree, then check and serve.

Hierarchical nav is two in-flow rows, not a dropdown. The top row is only Home,
Philosophy, Projects, and Support. Child links appear as a second row only on
pages in that section (Philosophy: Faith, Vocabulary; Projects: Contributors;
Support: Contact). Home has no second row. Do not use hover menus, plus
markers, or always-visible nested columns. `nav-ssg` sets `aria-current="page"`
on the current page's `<a>` (section parent or child). CSS
`:has([aria-current="page"])` shows that section's nested list.

## Scripture

Quoted scripture is the Original Douay-Rheims in the `original-douay-rheims/`
submodule (`bible/raw`). Old Testament: English College of Douay, 1609. New
Testament: English College of Rheims, 1582. Dataset:
[cryptoquick/original-douay-rheims](https://github.com/cryptoquick/original-douay-rheims)
(accessed: 2026-08-19). That is the unmodified historic translation, not
Challoner and not King James. Cite that fork. Do not use Bible Gateway KJV as
the source of the words.

Quote the actual words verbatim. Old spelling stays in quotes. Surrounding
prose is American English. This edition says **false testimony**,
**peace-makers**, **Paradise of pleasure**, **Cherubins**, and **a flaming and
a turning sword**. Do not invent verses. The word **karibu** is not in this
edition. If you keep a karibu historical gloss, it is a separate note, not a
Douay-Rheims quote.

## Public sources

Wikipedia is not a public source. Prefer Grokipedia. Citations on the pages
are ordinary `a` tags in the HTML. Do not print Wikipedia. Do not restore
Wikipedia.

Lean spec (`lean/Grokipedia.lean`, proved as part of `just check`): if a
Wikipedia `href` is present, find the Grokipedia equivalent
(`https://grokipedia.com/page/` plus the wiki title). If that equivalent
cannot be formed, or Grokipedia is insufficient for the citation, it is a
compile-time error (the well-formed site is uninhabited). Public pages
must use the Grokipedia URL, not the Wikipedia URL. Lean does not fetch
the network; sufficiency is the slug map plus an explicit sufficient
page (already cited on the site, or recorded in the spec). Unknown
Wikipedia titles are insufficient.

Lean proves that the public copy is logically consistent. It does not
prove that God exists. Grok OSS is not yet an operating system. Lean does
not prove that Surmount will endure in the world. Post-quantum
cryptography is not quantum computing. BIP 360 (proposed) and
libbitcoinpqc are PQC, not optical computers, neuromorphic in-memory
computers, or quantum computers. Do not put BIP 360 or libbitcoinpqc in a
home-page sentence with those machine classes.

## Holy Lean

Holy Lean is the Lean library that defines the theological and moral vocabulary
used on the site (sin, science as natural philosophy, scripture, scientific
method, theism, atheism, false witness, and the rest of `vocabulary.html`).
It lives in this repository at `lean/HolyLean.lean`. It is not a separate
repository and not a third flake.

`lean/DouayRheims.lean` holds the quoted strings and the warrant story:
`Warrant` is `oneVerse NamedQuotation` or `versePair NamedQuotation NamedQuotation`.
False testimony, peace-makers, and Cherubins use `oneVerse`. Humility uses
`versePair` of Matthew 11:29 and Philippians 2:3. The one-verse fragment is
`Iso OneVerseTerm OneVerseQuotation` (`one_verse_term_iso_quotation`). Theorems
prove each site quotation equals the Douay-Rheims source string. That is not
an isomorphism between science and scripture.

`lean/SiteConsistency.lean` is the inhabited well-formed model of the public
copy. It imports Holy Lean. None of these files prove that God exists, that
theism is proven, or that Surmount will endure in the world. They prove that
the encoded claims do not contradict (no `P ∧ ¬P`). Copy assertions are
structure fields, not custom Lean `axiom`s. There is no `sorry`. The public
copy says Grok OSS is not yet an operating system.

`lean/SiteNav.lean` is the inhabited well-formed model of the public nav tree.
`shared/nav.html` is the template. Each public `*.html` page's `<nav>` is also
source. Lean `include_str`s the template and each public page (same relative
paths as SiteLinks). Theorems run on the extracted printed `<nav>` (canonical
tree plus `aria-current="page"` on that page's link) and prove that extract
equals `renderNav`. Proving a copied fragment equal to its own pretty-printer
is not the job. If the pages and the template disagree, Lean must fail, and the
HTML must be fixed. That is not a traditional HTML test suite. Do not add
a cargo or shell nav-structure test harness to avoid stating the theorem.

Public **links** (header nav and body `href`s) are the same job. Lean must
see every public page's printed markup enough to prove internal targets
resolve: `*.html` hrefs are public pages, `#fragment` and `page.html#id`
targets exist as `id` on that page. A header-nav theorem that ignores body
links is not enough. Prefer the smallest Lean HTML subset that can state
those theorems (ids, hrefs, the nav fragment). Implement a Lean SSG only
for the subset that must generate or check that structure. Do not rewrite
visitor copy into Lean. Do not add a second test harness to avoid the
parser. HTML remains the citation source for prose and scripture.

## Better tools (pinned 2026-08-24)

If we need better tools, we always use better tools. Site consistency
(nav included) is Lean. Do not fall back to a traditional testing workflow
because it looks smaller. Improve the Lean model. Dual-pin: host
`~/.grok/AGENTS.md` § *Always use better tools*.

Lean style for this package follows
`lean4-skills/plugins/lean4/skills/lean4/SKILL.md`: 100-character lines,
`fun x ↦` for lambdas, snake_case theorems, UpperCamelCase types, no mathlib
file headers on this non-mathlib package.

## How to extend a proof

HTML is the citation source of truth. Copy words from the printed page, then
check them against `original-douay-rheims/bible/raw`. Do not invent verses.
Do not use King James or Challoner. Wikipedia is not a public source. Do not
print Wikipedia on the pages. Do not restore Wikipedia. Prefer Grokipedia.
Wikipedia stays process-only in this file.

1. Add or tighten the term on `vocabulary.html` (an `id` on the heading so
   other pages can link `vocabulary.html#sin` and the like).
2. If the term is warranted from scripture, quote the Douay-Rheims words
   verbatim, cite the verse, and document the Lean warrant on Vocabulary.
   Only the three one-verse terms are the Iso fragment. A pair warrant is
   `versePair`, not that Iso.
3. Use that wording on Faith, Philosophy, or other public pages. Link
   load-bearing words to the matching vocabulary id.
4. Choose one of these six add-paths. Do not mix them.

   **Printed verse** (string on the page, not a new unique pairing): add
   `def book_ch_vs`, `def site_book_ch_vs`, and
   `theorem site_book_ch_vs_eq_source : ... := rfl` in
   `lean/DouayRheims.lean`. Exodus 20:1-17 and Matthew 5:3-12 are this path
   except the three warranted verses. Do not add `WarrantedTerm`,
   `NamedQuotation`, `oneVerse`, or Iso constructors for a printed
   framework verse.

   **One-verse warrant** (one vocabulary term, one citation): add the string
   as above, then `WarrantedTerm`, `NamedQuotation`, `Warrant.oneVerse`,
   and the matching `OneVerseTerm` / `OneVerseQuotation` constructors.
   Extend `to_quotation` / `of_quotation` / the Iso `cases`. Prove site
   string equals source string by `rfl`. The three terms on this path are
   false testimony (Exodus 20:16), peace-makers (Matthew 5:9), and
   Cherubins (Genesis 3:24).

   **Pair warrant** (one vocabulary term, two citations): add both strings
   as printed verses, then `Warrant.versePair`. Do not force a two-verse
   term into the one-verse Iso fragment. Humility is the example: Matthew
   11:29 and Philippians 2:3. Keep `humility_warrant_ne_oneVerse`.

   **Site claim** (public sentence that could later contradict): add a field
   on `SiteCopy` and `WellFormed` in `lean/SiteConsistency.lean`, set it on
   `assertedCopy`, and prove it with `rfl` (or the same `nomatch` / pair
   style already in the file). If it is also vocabulary, add the matching
   Holy Lean field, `assertedVocabulary`, `HolyLean.WellFormed`, and extend
   `asserted_copy_agrees_with_holy_lean` when that theorem lists the field.
   Preserve existing theorem statements unless the copy itself changed.
   Do not add a field that God exists or that theism is proven.
   Do not add a field that grok-oss is an operating system, or that
   Surmount will endure in the world.
   Do not add a field that post-quantum cryptography is quantum computing,
   or that BIP 360 or libbitcoinpqc is an optical, neuromorphic, or
   quantum computer.

   **Nav tree** (public information architecture, not a vocabulary sentence):
   encode the change in `lean/SiteNav.lean`. `shared/nav.html` is the template.
   `include_str` that fragment and each public page (same relative paths as
   SiteLinks). Theorems run on the extracted printed `<nav>` (with
   `aria-current="page"` on the current page): that extract equals `renderNav`.
   Keep the inductive page type, `WellFormed` fields, and proofs that template,
   page navs, hrefs, top row, and section children match. If a page disagrees,
   fix the HTML. Do not add a third nesting level. Do not give Home a second
   row. Printed nav is `include_str`, not a self-equality on a copied fragment.
   Do not prove this with a new Rust test list.

   **Public links** (body and nav `href`s, not a vocabulary sentence): encode
   each public page's markup in Lean enough to extract `href` and `id`.
   Prove every in-site target resolves. Fix dangling or contradictory HTML.
   Smallest parser/SSG subset that makes `rfl` fail on a bad link. Do not
   invent a cargo or shell link crawler.

   **Grokipedia** (public source, not a vocabulary sentence): do not add a
   Wikipedia `href`. Use `https://grokipedia.com/page/Title`. If a Wikipedia
   URL appears, `lean/Grokipedia.lean` must find that Grokipedia equivalent.
   If Grokipedia is insufficient, Lean fails at compile time. Do not fetch
   the network in the kernel. Do not print Wikipedia.
5. Add a matching Lean definition in `lean/HolyLean.lean` when the sentence
   is vocabulary.
6. If you add a new root Lean file, list it in `lean/lakefile.toml` and in the
   Lean flake `fileset` in `lean/flake.nix`. Public HTML used by `include_str`
   in `SiteNav.lean`, `SiteLinks.lean`, and `Grokipedia.lean` must also be in
   that fileset (the eight public pages and `shared/nav.html`).
7. Typecheck locally with `lake env lean` from `lean/` if a Lean toolchain is
   available. The full gate is `just check` (nav, then Lean). Remote Lean
   on that gate must pass.

## Git

Agents do not run `git add`, `git commit`, or `git push`. The operator owns
version control.
