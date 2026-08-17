# Site redesign report

Date: 2026-08-14  
Workspace: `/home/hunter/Projects/surmount/site`

L2 coordinated three L3 specialists (CSS, HTML pages, favicon) plus a read-only audit. A follow-up CSS edit dropped a double indent on the in-header nav.

## Files written

| Path | Role |
|------|------|
| `index.html` | Home |
| `philosophy.html` | Philosophy (sourced-only, thin on purpose) |
| `support.html` | Support / BOLT-12 |
| `styles.css` | Shared unminified stylesheet |
| `favicon.svg` | Linked favicon (white peak on black) |
| `favicon.ico` | Replaced. Old multi-shade icon is gone. New file is a 16x16 ICO whose pixels are only `#000000` and `#FFFFFF` (default `/favicon.ico` requests). |

Left on disk, unused: `logo.png` (512x512 RGBA, blues/grays/alpha). Pages do not reference it. No `og:image`.

Removed leftover: empty `.keep-no` from the favicon specialist.

No extra markdown besides this report and the earlier inventory at `.agents/reports/philosophy-copy.md`.

## Color audit

**Pass.** Grep of html/css/svg (and unique-color check on the new ICO) found only the eight DOGE values.

Used in CSS/SVG:

- `#000000` background
- `#FFFFFF` body type, h1, current nav item, favicon mark
- `#00FFFF` links, button
- `#FFFF00` h2, hover, copied flash, focus ring
- `#FF00FF` visited links
- `#00FF00` BOLT-12 invoice string

Unused allowed: `#FF0000`, `#0000FF` (blue kept off body type).

Absent: other hex, `rgb`/`rgba`/`hsl`/`hsla`, alpha in CSS, named `green`/`navy`/`orange`/`gray`, old `#0e2436` / `#1b3b57` / `#1e90ff` / `#ff4500`, box-shadow, gradients, opacity.

Spec cited at the top of `styles.css`:
https://github.com/SurmountSystems/specs/blob/main/0001_DOGE.md
(accessed: 2026-08-14)

HTML and CSS are unminified, 2-space indent, one column, `system-ui, sans-serif`, `max-width: 40rem`, line-height 1.6.

## Copy used vs omitted

### Used (all three pages share identity + nav)

- Surmount Systems
- Bitcoin Initiative for Quantum Security
- Dedication, verbatim
- Nav: Home, Philosophy, Support (`aria-current="page"` on the current item)
- X `@SurmountSystems` (typo `@SurmountsSystems` is gone)
- Telegram group (same URL as before)
- Org GitHub
- Open Graph / Twitter `summary` cards; `og:url` per page; no images

### Home only

- Projects sentence uses the BIP number only: BIP 360 as a proposed soft fork that adds a quantum-resistant output type.
- Links: bitcoin/bips `bip-0360.mediawiki`, https://bip360.org/, GitHub
- Contact: X, Telegram
- Support is a link to `support.html`, not invoices

### Support only

- 501(c)(3) sentence
- BOLT-12 offer (verbatim) plus https://bolt12.org/
- Receipts: DM `@SurmountSystems` on X
- Small unminified click-to-copy on the offer (button and click on the string). Flash is CSS class `copied` (yellow). If clipboard fails, the string stays selectable.

### Philosophy only

- Dedication
- 501(c)(3)
- Three short BIP 360 notes, attributed, no output-type nickname:
  - tapscript-native output that can be used in a quantum-resistant manner
  - even if quantum computers never break ECC, fear can affect confidence; simple low-risk options are worth considering
  - transition time at BIP, software, infrastructure, and user levels matters
- The page is thin. That is correct.

### Omitted on purpose

- Silent Payments address `sp1qqveek65…` and silentpayments.xyz (gone from the tree)
- Stale P2QRH / QuBit homepage sentence
- P2TSH / P2MR / any hybrid output-type name
- X bio (high assurance, AI platforms, defense in depth)
- carbonado / pandora / colibri README lines
- Dollar-figure threat copy
- EIN, mailing address, PayPal, `hunter@surmount.systems`
- Donation invoices on the home page
- Decorative `logo.png` / old non-DOGE `og:image`

## Logo and favicon

- `logo.png` is not on the page and not used as `og:image`. File left unused (non-DOGE).
- HTML icons point at `favicon.svg`: black square, white geometric peak (Surmount), only `#000000` and `#FFFFFF`.
- Old multi-shade `favicon.ico` was overwritten. A first stub was invalid (SVG bytes in an `.ico` name). It was replaced with a real 16x16 Windows icon whose unique pixels are black and white only. Browsers that still request `/favicon.ico` get that, not the old blues/grays.

## Remaining operator decisions

1. **Philosophy stays sourced-only and thin.** There is still no operator-written manifesto. If you want values, AI/defense-in-depth, or a longer About, that text has to come from you.
2. **BIP naming is BIP 360 only.** The site does not say P2QRH, P2TSH, or P2MR. The published BIP title is currently Pay-to-Merkle-Root (P2MR); this redesign follows the instruction to use the stable number and not invent a hybrid name.
3. **`logo.png` is still in the tree** for anyone who hotlinks the old URL. It is not DOGE-conformant. Delete it when you want that URL to 404.
4. **No commit.** Tree is ready for a local browser pass.

## Verify checklist

1. Color audit: pass (eight colors only).
2. `sp1qqveek65`: gone.
3. Three pages link to each other: pass.
4. HTML/CSS unminified: pass.
