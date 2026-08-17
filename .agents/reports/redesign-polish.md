# Redesign polish report

Date: 2026-08-14  
Workspace: `/home/hunter/Projects/surmount/site`

Surgical pass on the already-landed redesign. No rewrite, no new copy, no minify, no commit, no README.

## What changed

### 1. Unused `logo.png` deleted

Removed `/home/hunter/Projects/surmount/site/logo.png` (off-palette 512×512). A directory deploy can no longer serve it at `/logo.png`.

Grep of the tree for `logo` / `logo.png`: no remaining references in HTML or CSS (or elsewhere). Favicons stay as `favicon.svg` / `favicon.ico`.

### 2. `styles.css`

- Dropped unused `footer` from the shared column selector (`header, main` only).
- Removed the standalone `footer { margin-bottom: 1.5rem; }` rule. No `<footer>` in any page.
- Added `html { background-color: #000000; }` so overscroll matches the page.
- `button` now has `font-size: inherit` and `padding: 0.35rem 0.75rem` so the copy control is usable. Colors unchanged (`#000000` / `#00FFFF`, hover `#FFFF00`).
- `.tagline { margin-top: 0.25rem; }` only. No new color.

### 3. HTML structure (copy unchanged)

`index.html`: Projects links (BIP 360, bip360.org, GitHub) and Contact links (X, Telegram) are simple `<ul>` lists instead of one `<p>` per link. Project intro paragraph and Support paragraph are unchanged. List chrome is browser default; nav `ul` rules stay scoped to `nav`.

`philosophy.html`: added `<h2>Philosophy</h2>` as the first child of `<main>`, matching Support’s heading pattern. Existing paragraphs and BIP 360 notes are unchanged.

`support.html`: not touched.

## Color re-grep (after edits)

**Pass.** html / css / svg hex, `rgb`/`hsl`, and named-color search found only these DOGE values:

| Hex | Where |
|-----|--------|
| `#000000` | `html`/`body` background, button background, favicon field |
| `#FFFFFF` | body type, h1, current nav item, favicon mark |
| `#00FFFF` | links, button |
| `#FFFF00` | h2, hover, copied flash, focus ring |
| `#FF00FF` | visited links |
| `#00FF00` | BOLT-12 invoice string |

Unused allowed: `#FF0000`, `#0000FF`.

Absent: other hex, `rgb`/`rgba`/`hsl`/`hsla`, named CSS colors, leftover `footer` rules, `logo.png`.

Spec still cited at the top of `styles.css`:
https://github.com/SurmountSystems/specs/blob/main/0001_DOGE.md
(accessed: 2026-08-14)

## Not done (per brief)

- No invented philosophy text.
- Silent Payments not added back.
- No minify.
- No commit.
- No README.
