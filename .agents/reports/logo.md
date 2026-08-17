# Logo lockup

The site header is now the specified lockup: a big white geometric plus over letterspaced SURMOUNT in Cinzel Regular, on black. The legal name stays Surmount Systems for assistive tech. Nothing was committed.

## Files touched

- `index.html`, `philosophy.html`, `support.html`: H1 is the lockup. Inner pages wrap it in `a.logo-link` to `index.html`. Tagline, nav, and page copy unchanged.
- `styles.css`: local `@font-face`, `.logo` / `.logo-mark` / `.logo-word` / `.logo-link` / `.visually-hidden`. Header `margin-top` is 2.25rem so the plus has air.
- `fonts/cinzel-regular.woff2`, `fonts/OFL.txt`: self-hosted Cinzel Regular and SIL OFL 1.1.
- `favicon.svg`, `favicon.ico`: white plus on black. Old mountain-peak icon is gone.
- `logo.svg`: same plus-only mark as the favicon. No wordmark (HTML/CSS owns SURMOUNT).
- `LOGO.md`: standing philosophy at the site root.

## Font source and license

Google Fonts `ofl/cinzel` ships only variable `Cinzel[wght].ttf`. Static Regular 2.00 came from the upstream Cinzel repo:

- TTF: https://github.com/NDISCOVER/Cinzel/raw/master/fonts/ttf/Cinzel-Regular.ttf
- OFL: https://raw.githubusercontent.com/google/fonts/main/ofl/cinzel/OFL.txt (also the project authors' SIL OFL 1.1)

Converted on the host with `/usr/bin/woff2_compress`. The TTF was not left in `fonts/`. `@font-face` points only at `fonts/cinzel-regular.woff2`. `fc-scan` reports family Cinzel, style Regular, PostScript `Cinzel-Regular`. No `fonts.googleapis.com`.

## How the plus is drawn

Header mark is CSS, not a Unicode plus and not a font glyph. `.logo-mark` is a 5rem square. `::before` is the horizontal bar, `::after` the vertical bar. Both `#FFFFFF`, 15% of the square, optically centered.

Favicon and `logo.svg` use two overlapping white rectangles on a full-bleed `#000000` 32×32 square: vertical `x=13 y=4 w=6 h=24`, horizontal `x=4 y=13 w=24 h=6`.

`favicon.ico` is a 16×16 plus of the same proportion, drawn with ImageMagick rectangles. Histogram is 193× `#000000FF` and 63× `#FFFFFFFF` (opaque). ImageMagick stores ICO as 32bpp; every alpha sample is 255.

## Header contract

```
        +
    SURMOUNT

Bitcoin Initiative for Quantum Security   (existing tagline, left as before)

Home   Philosophy   Support
```

Visible word is SURMOUNT only. A `.visually-hidden` span keeps the accessible name "Surmount Systems". Decorative mark and word are `aria-hidden`. Logo link stays `#FFFFFF` on hover and visited so site cyan/yellow link colors cannot recolor it.

## Verify

1. Color grep of html/css/svg: only DOGE hex. Lockup and SVG marks use `#000000` / `#FFFFFF` only.
2. All three pages show the lockup.
3. Silent payments still absent.
4. Font is local. No Google Fonts CDN.
5. `LOGO.md` matches the implemented mark (plus, not a crucifix; Cinzel Regular inscriptional Roman; white on black; favicon is the plus alone).

## Leftover decisions

- Lockup is centered. Tagline and nav stay left, as they were, per "keep existing nav and tagline."
- SVG bars are 6/32 (18.75%) so the 16px icon stays on integer pixels. CSS bars are 15%. Same plus, slightly different weight at the two sizes.
- `logo.svg` is the plus only. Wordmark is not converted to paths.
- Index H1 is not a self-link. Philosophy and Support link home.
- ICO includes an unused opaque alpha channel because that is how ImageMagick writes ICO. Pixels are only black and white.

L3 notes (css, html, favicon, doc) are beside this file if a later pass needs the raw handoff.
