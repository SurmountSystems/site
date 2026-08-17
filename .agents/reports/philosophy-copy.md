# Surmount Systems philosophy, mission, and support copy inventory

Date: 2026-08-14  
Workspace: `/home/hunter/Projects/surmount/site`  
Purpose: inventory existing public and sibling-tree copy so a site redesign does not invent ideology.

**Process note:** This session had no L3 spawn tool. The L2 worker did the file and public walks itself. Scope was the site tree, sibling trees under `/home/hunter/Projects/surmount/` and `/home/hunter/Projects/bitcoin/`, GitHub org API, live `surmount.systems`, Charity Navigator, and X `@SurmountSystems`.

**Bottom line:** There is **no philosophy page, manifesto, values list, or IRS mission statement** in the site tree or in public org sources searched. The only durable org sentences are a short tagline plus one dedication paragraph on the local site (and the same tagline on GitHub). **If the redesign wants a philosophy or values page, the operator must write it.** Do not synthesize one from product READMEs.

---

## 1. Current site (local working copy)

Source: `/home/hunter/Projects/surmount/site/index.html`

The tree is four files: `index.html`, `styles.css`, `logo.png`, `favicon.ico`. There is no About, Philosophy, Mission, Manifesto, or Donate page besides the single homepage.

### Tagline and dedication (also used as Open Graph / Twitter description)

Title and H2:

> Surmount Systems  
> Bitcoin Initiative for Quantum Security

Body and meta description (verbatim):

> At Surmount Systems, we are dedicated to pioneering advancements in quantum security for Bitcoin. Our initiative focuses on ensuring the integrity and security of the timechain in the quantum age.

### Projects (verbatim)

> Currently we're working on a BIP for a new quantum-resistant address type called P2QRH (Pay to Quantum Resistant Hash), for use in a future soft fork called QuBit.

Links on that page:

- BIP 360 (P2QRH branch): `https://github.com/cryptoquick/bips/blob/p2qrh/bip-0360.mediawiki`
- Org GitHub: `https://github.com/SurmountSystems`

**Name drift (fact, not philosophy):** the local homepage still says P2QRH / QuBit. The current BIP 360 intro at `/home/hunter/Projects/bitcoin/bip360.org/` and `bip360.html` say Pay-to-Tapscript-Hash (P2TSH). A redesign should not invent a new name. Ask the operator which name is current for the homepage.

### Contact (verbatim)

Section heading: `Contact Us`

- `https://x.com/SurmountSystems` labeled `@SurmountSystems on X`
- Telegram group: `https://t.me/+bqrj37t3xXg5ZTg5`

### Support / donation (verbatim)

Section heading: `Support Our Work`

> The Surmount Systems Foundation is a 501(c)(3) non-profit organization.

> We accept Silent Payments:

```
sp1qqveek65zqcz9xl44pjr65tzexlja7zn05kpe8rxxupr43lgtt6czgq6mm3vlgpwzap4f05854qkmqc2kaefl3e8dwcn24ykrrrck2vcspcfkk4kh
```

Silent Payments explainer link: `https://silentpayments.xyz`

> We also accept BOLT-12 Lightning payments:

```
lno1zrxq8pjw7qjlm68mtp7e3yvxee4y5xrgjhhyf2fxhlphpckrvevh50u0q2pmrtnrsk8qdhsad5fpxeqaa7zyea93kvuas6ycchu54mwpy0ux5qszx7e4hmyzv9cu8wp8rsuqgg860hnjyty84qp9eyyvq8pcr77nxjcqqveun7k49f74qm54fxxkln6s7tq970hhzpljsr7dvqjpdajc4f572qsk8xglxkg9jau9mys7xjyet536kcc7qvjmf0l4uver2a3trehyn58mz7d2rj0tjkvrg6k68cqxwcfd80crzqqsn54x9hkydqd9z2pu5a8u7zan4u
```

BOLT-12 explainer link: `https://bolt12.org/`

> Inquiries regarding donations, such as to request a receipt, should be sent via direct message to @SurmountsSystems on X.

That last handle is **misspelled** in the HTML (`@SurmountsSystems`). The working handle elsewhere is `@SurmountSystems`. Do not treat the extra `s` as a second account.

**Payment methods on this page only:** Silent Payments and BOLT-12. No PayPal, wire, check, ACH, on-chain reuse address, fiat form, EIN, or mailing address appears on the site.

### Live apex vs local copy

Fetched `https://surmount.systems/` on 2026-08-14. The live page was a placeholder:

> UNDER CONSTRUCTION  
> surmount.systems

So the local `index.html` is the last full public homepage text found on disk. Do not assume the live site still publishes donation strings until it is redeployed.

X @SurmountSystems, 2026-07-27, said servers were moving, the website would be down, and questions should go to @cryptoquick via X DM.

---

## 2. GitHub org (public)

Source: `https://api.github.com/orgs/SurmountSystems` (fetched 2026-08-14)

| Field | Value |
| --- | --- |
| name | Surmount Systems |
| description | Bitcoin Initiative for Quantum Security |
| blog | https://surmount.systems |
| twitter_username | SurmountSystems |
| location | United States of America |
| email | null |
| created_at | 2024-05-30 |

There is **no** `SurmountSystems/.github` profile README (404). Org description matches the site H2 only. No philosophy text.

Repos visible on the org page include product and fork trees (gabriel, colibri, grok-oss, zed, specs, surmount-server, bitcoin-core, secp256k1, and others). Repo descriptions are product descriptions, not org mission.

---

## 3. X / Twitter @SurmountSystems

Profile bio (verbatim, as returned by X search tools, 2026-08-14):

> Developing high assurance cryptographic protocols, AI platforms, and advanced computing technologies for proven protocol, systems, and defense in depth security

This is **broader** than the website dedication. It is the only sourced sentence that names AI platforms and defense in depth as org work. It is still not a philosophy or values list.

Sourced posts with mission-like wording:

1. 2024-11-12, @SurmountSystems quoting @cryptoquick  
   > We can use your help to Make Bitcoin Quantum Secure! See our website, [surmount.systems] for donation links where you can pay anonymously and without address reuse in Bitcoin using either Silent Payments, or BOLT-12. If you can't donate, that's okay, but please share!

2. 2025-02-28, @SurmountSystems (byline Kyle Crews)  
   > On a mission for Bitcoin quantum resistance, achieving consensus one HODLer at a time—Surmount Systems Foundation at Bitcoin Investor Week!

3. 2025-03-01  
   > Sharing the plan for bitcoin quantum resistance with the great @APompliano. The time for quantum proofing bitcoin via soft-fork is now. #BIP360

4. 2025-05-18  
   > Some will see the work that we're doing on BIP-360 as preventing an imaginary threat to an imaginary money.  
   > Yet-- the $40 billion invested into quantum computing is a potential threat to a $2 trillion dollar asset.

@cryptoquick quoted in the 2024-11-12 thread (Hunter Beast bio on that post: `Author #BIP360` / `CEO @SurmountSystems`):

> The government is disallowing use of ECDSA within 10 years. If you know anything about how Bitcoin transactions work... Well, do with that information what you will. Support P2QRH and our work at @SurmountSystems!

Do **not** promote those dollar figures or "national security imperative" lines as standing org philosophy unless the operator re-approves them. They are dated posts, not a manifesto.

---

## 4. BIP 360 / bip360.org (Hunter writing; not org About copy)

These sentences are **BIP 360 product and motivation copy**, authored with others. They are not labeled Surmount Systems philosophy. Safe to cite as BIP work, not as org values.

### Intro site

Source: `/home/hunter/Projects/bitcoin/bip360.org/index.html` (also public as `https://bip360.org/`)

H3:

> to enable Pay-To-Tapscript-Hash: a proposed first step in advancing Bitcoin quantum resistance

Paragraphs:

> BIP 360 proposes a new tapscript-supportive output type for Bitcoin: Pay-To-Tapscript-Hash (P2TSH), which is nearly identical to Taproot addresses but with the quantum-vulnerable keypath spend removed.

> This proposal has been put forth by co-authors Hunter Beast, Ethan Heilman, and Isabel Foxen Duke to address Bitcoin's most pressing quantum vulnerability: quantum-vulnerable addresses. At present, P2PK and Taproot addresses remain the most vulnerable address types on the network.

> Given the critical role of Taproot addresses in Bitcoin scaling (including Lightning, BitVM, Ark, and other key technologies), we believe it's prudent to ensure that Bitcoin has a tapscript-native address output type that is protected from long-exposure quantum attacks.

> The team additionally intends to introduce post-quantum signature schemes to protect Bitcoin addresses from potential short-exposure quantum attacks in future proposals. That said, we see the introduction of a quantum-resistant tapscript-native output type as a critical and relatively unobtrusive "first step" in making Bitcoin quantum-resistant.

Heading:

> MAKE BITCOIN QUANTUM RESISTANT

> While the amount of time we have to prepare for a quantum event is uncertain, it seems reasonable to ensure that Bitcoin is prepared for a range of possible outcomes. Additionally, we must consider the total time needed for an effective transition—at the BIP level, the software level, the infrastructure level, and the user-transition level.

Attributed quote, Hunter Beast, Co-Author of BIP 360:

> A smooth and effective QR transition plan for Bitcoin could take several years to execute—with more prep time inevitably leading to better security outcomes for all.

Media blurb (`media.html`):

> Hunter Beast, Protocol Engineer at Anduro and Project Lead at Surmount Systems

### BIP text (Abstract / Motivation excerpts)

Source: `/home/hunter/Projects/bitcoin/bip360.org/bip360.html`  
Author line: `Hunter Beast <hunter@surmount.systems>`

> This document proposes a new output type: Pay-to-Tapscript-Hash (P2TSH), via a soft fork. P2TSH outputs operate with nearly the same functionality as P2TR (Pay-to-Taproot) outputs, but with the key path spend removed.

> Through this modification, P2TSH outputs allow developers to use tapscript in a manner that is:  
> 1. resistant to long exposure attacks by Cryptographically Relevant Quantum Computers (CRQCs), and  
> 2. resistant to future cryptanalytic approaches that may compromise the elliptic curve cryptography (ECC) used by Bitcoin.

> In the most optimistic case, wherein quantum computers never pose a significant risk to ECC, we understand that the possibility of quantum advancement alone may be influencing adoption and broad confidence in the Bitcoin network. In other words, we believe users' fear of quantum computers may be worth addressing regardless of CRQC viability. Given these concerns, we think it's worth considering simple low risk changes that create options for using Bitcoin in a quantum-resistant way.

> As a conservative first step in this effort, we propose Pay-to-Tapscript-Hash (P2TSH), a tapscript-native output type that can be used in a quantum resistant manner.

Updates subscribe link on that site: `https://cryptoquick.substack.com/` (personal Substack, not a Surmount newsletter).

---

## 5. Sibling Surmount trees (product copy, not org philosophy)

Searched `/home/hunter/Projects/surmount/` READMEs and markdown. **No ABOUT, PHILOSOPHY, or MANIFESTO file** for the foundation.

Usable only as product labels. Do not lift these into site ideology without operator text.

### powcrypt

`/home/hunter/Projects/surmount/powcrypt/README.md`

> A Surmount Systems Bitcoin Quantum Security initiative

### carbonado

`/home/hunter/Projects/surmount/carbonado/README.md`

Product line:

> An apocalypse-resistant data storage format for the truly paranoid.

Section titled "Quantum Resistance & Surmount Mission":

> The v2 design aligns with Surmount Systems’ focus on accelerating Bitcoin’s quantum resistance:

That is the closest sibling-tree "mission" sentence. It restates quantum resistance. It is not a values page.

### libbitcoinpqc

`/home/hunter/Projects/surmount/libbitcoinpqc/README.md`

> A C library for Post-Quantum Cryptographic (PQC) signature algorithms for Bitcoin.

Also states PQC signatures are a **separate effort** from current BIP 360 (P2MR / P2TSH). Technical, not ideology.

### surmount-server

`/home/hunter/Projects/surmount/surmount-server/README.md`

> Hermetic NixOS foundation for Surmount mail and web services.

> Operator-owned infrastructure for Surmount Systems.

Primary domain named: `surmount.systems`. Mail: `mail.surmount.systems`. Management UI: `services.surmount.systems`. This is ops copy, not public philosophy.

### specs

`/home/hunter/Projects/surmount/specs/README.md`

> This repository holds small, precise specifications maintained by Surmount.

Writing rules (American English, ASCII, high precision) are **spec form**, not public mission.

### beastdb

`/home/hunter/Projects/surmount/beastdb/README.md`

> beastdb is a production-oriented, high-assurance embedded key-value store.

"High-assurance" matches the X bio word. Still product, not org About.

### pandora

`/home/hunter/Projects/surmount/pandora/README.md` contains an **Investor Pitch** paragraph claiming Surmount is "positioned to deliver the infrastructure layer for post-quantum cryptography at scale." Treat as **unpublished local pitch**, not approved public philosophy. Do not put it on the site unless the operator says so.

### colibri

`colibri/README.md` has "The research mission." That is **upstream Colibri** copy in a fork, not Surmount Foundation law.

### `/home/hunter/Projects/foundation/`

Empty directory. No nonprofit paperwork in that tree.

---

## 6. Support / donation facts (compiled)

| Fact | Source | On current site? |
| --- | --- | --- |
| Legal / public name used for nonprofit: **Surmount Systems Foundation** | site `index.html`; X 2025-02-28; Charity Navigator | Yes |
| **501(c)(3)** | site `index.html`; Charity Navigator | Yes |
| EIN **33-1336271** | Charity Navigator `https://www.charitynavigator.org/ein/331336271` (accessed 2026-08-14) | **No** |
| Address listed by Charity Navigator: 6635 S Dayton St Ste 310 #370, Greenwood Village, CO 80111-6156 | Charity Navigator | **No** |
| Charity Navigator classifies as Educational Organization; **Mission not available**; not rated | Charity Navigator | N/A |
| Silent Payments address (see section 1) | site `index.html`; X 2024-11-12 | Yes |
| BOLT-12 offer (see section 1) | site `index.html`; X 2024-11-12 | Yes |
| Donations described as anonymous and without address reuse | X 2024-11-12 | Implied by payment types, not those words |
| Receipt / donation inquiries: X DM | site (typo handle); 2026 outage post points to @cryptoquick DM | Yes, with typo |
| Other payment methods (PayPal, wire, check, card, EIN donation form) | **not found** | No |
| Public org email on GitHub | null | No |
| Author email on BIP 360 | `hunter@surmount.systems` | Not on homepage |
| Telegram group | site | Yes |
| X | `@SurmountSystems` | Yes |

Third-party aggregator aixbt.tech repeats the site dedication plus 501(c)(3). It is a scrape, not a new source.

---

## 7. What is MISSING

Say this plainly:

1. **No philosophy, manifesto, creed, or values page** exists in the site tree, GitHub org profile, Charity Navigator mission field, or sibling Surmount READMEs searched.
2. **No operator-approved long About** beyond one dedication paragraph and the tagline "Bitcoin Initiative for Quantum Security."
3. **No IRS Form 990 mission text** was found in-tree or on Charity Navigator.
4. **X bio and website dedication do not match.** Website is Bitcoin quantum security / timechain. X bio adds high-assurance protocols, AI platforms, advanced computing, and defense in depth. A redesign that picks one without asking invents a narrower or broader org than the other channel.
5. **BIP 360 name on the homepage is stale** relative to bip360.org (P2QRH/QuBit vs P2TSH). That is a product-name decision, not philosophy.
6. **Live apex is UNDER CONSTRUCTION.** Donation strings live only in the local `index.html` and in an old X post until republished.
7. **No fiat / EIN / mailing donation path** is published on the site.
8. **Contact email is not on the homepage.** `hunter@surmount.systems` appears only as BIP author contact.

---

## 8. Recommended page outline

**There is not enough sourced ideology for a Philosophy page.**

If the redesign only restates what already exists, use this outline and **only** these sentences (or close paraphrases the operator already owns):

1. **Header**  
   Surmount Systems  
   Bitcoin Initiative for Quantum Security

2. **Dedication**  
   At Surmount Systems, we are dedicated to pioneering advancements in quantum security for Bitcoin. Our initiative focuses on ensuring the integrity and security of the timechain in the quantum age.

3. **Legal**  
   The Surmount Systems Foundation is a 501(c)(3) non-profit organization.

4. **Current work (ask operator which BIP name)**  
   Either keep the homepage P2QRH/QuBit sentence, or switch to sourced bip360.org P2TSH sentences. Do not blend them into a new hybrid name.

5. **Support**  
   Silent Payments and BOLT-12 strings from `index.html`.  
   Receipts: DM @SurmountSystems on X (fix the typo).  
   Optional, only if operator wants IRS facts on the site: EIN 33-1336271 from Charity Navigator.

6. **Contact**  
   X `@SurmountSystems`, Telegram group link, GitHub org.  
   Optional: `hunter@surmount.systems` from the BIP author line.

7. **Do not add** a Values, Manifesto, or Philosophy section from carbonado, pandora, colibri, or X dollar-figure posts.

**Operator must write philosophy** if the redesign wants:

- why the foundation exists beyond quantum Bitcoin
- whether AI, high-assurance systems, and defense in depth belong on the homepage (they exist only on the X bio today)
- values (open source, privacy, non-harm, etc.)
- a longer About Hunter / team
- donation methods other than Silent Payments and BOLT-12

Until that text exists in the operator's words, the honest site is tagline + dedication + projects + support + contact.
