/-
  Encoded Grokipedia public-source spec for surmount.systems.

  Wikipedia is not a public source. Public pages must cite Grokipedia, not
  Wikipedia. This library does not fetch the network. It does not prove that
  God exists, that theism is proven, that grok-oss is an operating system,
  that Surmount will endure in the world, or that a Grokipedia URL returns
  HTTP 200.

  If a Wikipedia href is present, find the Grokipedia equivalent:
  `https://grokipedia.com/page/` plus the wiki title. The title is the
  `/wiki/Title` path on http or https, on `en.wikipedia.org`,
  `www.wikipedia.org`, or any `*.wikipedia.org` host, with an optional
  fragment. Percent-encoded bytes such as `%20` are decoded. Spaces become
  underscores. Underscores already in the title stay. Grokipedia uses
  underscores in titles.

  There is no equivalent for a Wikipedia homepage, a non-wiki path, an empty
  title, or the `Special:`, `File:`, and `Help:` namespaces. Grokipedia URLs
  are not Wikipedia URLs.

  Sufficiency is data, not a network fetch. A formed equivalent is sufficient
  when that exact Grokipedia URL already appears as an href on the printed
  public pages, or when it is recorded in `extraSufficient` in this file.
  Unknown Wikipedia titles are insufficient.

  If printed HTML contains a Wikipedia href whose equivalent cannot be formed,
  or whose Grokipedia page is insufficient, `WellFormed` is false and the
  inhabited site theorem fails to compile. That is the compile-time error.
  If every Wikipedia href has a sufficient equivalent, the pages still must
  not print Wikipedia. Public citations must use the Grokipedia URL.

  Copy assertions are structure fields, not custom Lean `axiom`s. There is
  no `sorry`. HTML remains the citation source for prose. Fixtures in this
  file are not public pages. Do not add Wikipedia hrefs to public HTML.
-/

import SiteLinks

namespace Grokipedia

set_option maxRecDepth 16384

/-- Hex nibble, or none if the character is not `0-9A-Fa-f`. -/
def hexVal (c : Char) : Option Nat :=
  let n := c.toNat
  if '0'.toNat ≤ n ∧ n ≤ '9'.toNat then some (n - '0'.toNat)
  else if 'A'.toNat ≤ n ∧ n ≤ 'F'.toNat then some (n - 'A'.toNat + 10)
  else if 'a'.toNat ≤ n ∧ n ≤ 'f'.toNat then some (n - 'a'.toNat + 10)
  else none

/-- Decode `%XX` bytes as characters. Titles on this site are ASCII. -/
def urlDecodeList : List Char → List Char
  | [] => []
  | '%' :: a :: b :: rest =>
      match hexVal a, hexVal b with
      | some hi, some lo => Char.ofNat (hi * 16 + lo) :: urlDecodeList rest
      | _, _ => '%' :: urlDecodeList (a :: b :: rest)
  | c :: rest => c :: urlDecodeList rest

def urlDecode (s : String) : String :=
  String.ofList (urlDecodeList s.toList)

/-- Grokipedia titles use underscores, not spaces. -/
def spacesToUnderscore (c : Char) : Char :=
  if c == ' ' then '_' else c

def normalizeTitle (raw : String) : String :=
  (urlDecode raw).map spacesToUnderscore

def restAfterScheme (url : String) : String :=
  if SiteLinks.hasPref url "https://" then SiteLinks.dropNat url 8
  else if SiteLinks.hasPref url "http://" then SiteLinks.dropNat url 7
  else ""

/-- Drop `host[:port]` so the remainder starts at `/`, `?`, `#`, or is empty. -/
def dropAuthority : List Char → List Char
  | [] => []
  | c :: rest =>
      if c == '/' || c == '?' || c == '#' then c :: rest
      else dropAuthority rest

def afterAuthority (url : String) : String :=
  String.ofList (dropAuthority (restAfterScheme url).toList)

/-- Path without query or fragment. -/
def pathOnly (url : String) : String :=
  let a := afterAuthority url
  let noFrag :=
    match a.splitOn "#" with
    | p :: _ => p
    | [] => a
  match noFrag.splitOn "?" with
  | p :: _ => p
  | [] => noFrag

def wikiPrefix : String := "/wiki/"

/-- Wikipedia namespaces that are not articles, so they have no equivalent. -/
def isExcludedTitle (title : String) : Bool :=
  SiteLinks.hasPref title "Special:" ||
    SiteLinks.hasPref title "File:" ||
      SiteLinks.hasPref title "Help:"

/-- Article title from a Wikipedia URL, or none when there is no equivalent. -/
def wikiTitle? (url : String) : Option String :=
  if !SiteLinks.isWikipediaHost (SiteLinks.hostOf url) then
    none
  else
    let path := pathOnly url
    if !SiteLinks.hasPref path wikiPrefix then
      none
    else
      let raw := SiteLinks.dropNat path wikiPrefix.length
      if raw == "" then
        none
      else
        let title := normalizeTitle raw
        if title == "" || isExcludedTitle title then none else some title

def grokipediaPrefix : String := "https://grokipedia.com/page/"

def grokipediaUrl (title : String) : String :=
  grokipediaPrefix ++ title

/-- Grokipedia equivalent of a Wikipedia article URL, if one can be formed. -/
def equivalent? (url : String) : Option String :=
  match wikiTitle? url with
  | some t => some (grokipediaUrl t)
  | none => none

/-- Sufficiency of one Wikipedia href against printed citations, not a fetch. -/
inductive GrokipediaStatus where
  | sufficient (url : String)
  | insufficient
  deriving DecidableEq, Repr

/-- Full Grokipedia URLs accepted even if they are not yet printed as hrefs. -/
def extraSufficient : List String := []

def isGrokipediaPageHref (href : String) : Bool :=
  SiteLinks.hasPref href grokipediaPrefix &&
    SiteLinks.dropNat href grokipediaPrefix.length != ""

def allHrefs (s : SiteLinks.Site) : List String :=
  SiteNav.allPages.foldr (fun p acc ↦ SiteLinks.hrefsOf s p ++ acc) []

/-- Grokipedia page hrefs already printed on the public pages. -/
def printedAccepted : List String :=
  (allHrefs SiteLinks.assertedSite).filter isGrokipediaPageHref

def isAcceptedEquivalent (gurl : String) : Bool :=
  printedAccepted.contains gurl || extraSufficient.contains gurl

/-- Status of one href: insufficient when no equivalent or Grokipedia is unknown. -/
def status (href : String) : GrokipediaStatus :=
  match equivalent? href with
  | none => .insufficient
  | some gurl =>
      if isAcceptedEquivalent gurl then .sufficient gurl else .insufficient

def wikipediaHrefs (s : SiteLinks.Site) : List String :=
  (allHrefs s).filter (fun h ↦ SiteLinks.classify h == .wikipedia)

/-- Every Wikipedia href on `s` has a sufficient Grokipedia equivalent. -/
def wikipediaHrefsSufficient (s : SiteLinks.Site) : Bool :=
  (wikipediaHrefs s).all (fun h ↦
    match status h with
    | .sufficient _ => true
    | .insufficient => false)

/-- Every grokipedia.com href is `https://grokipedia.com/page/` plus a title. -/
def grokipediaHrefsArePages (s : SiteLinks.Site) : Bool :=
  (allHrefs s).all (fun h ↦
    if SiteLinks.hostOf h == "grokipedia.com" then isGrokipediaPageHref h
    else true)

def wellFormedBool (s : SiteLinks.Site) : Bool :=
  wikipediaHrefsSufficient s &&
    SiteLinks.noWikipedia s && grokipediaHrefsArePages s

/--
  Well-formed Grokipedia spec: Wikipedia hrefs (if any) have a sufficient
  equivalent, public pages still do not print Wikipedia, and every printed
  Grokipedia href is a `https://grokipedia.com/page/` URL.
-/
structure WellFormed (s : SiteLinks.Site) : Prop where
  wikipediaHrefsSufficient : wikipediaHrefsSufficient s = true
  noWikipedia : SiteLinks.noWikipedia s = true
  grokipediaHrefsArePages : grokipediaHrefsArePages s = true

theorem not_well_formed_of_insufficient
    {s : SiteLinks.Site} (h : wikipediaHrefsSufficient s = false) :
    ¬ WellFormed s :=
  fun wf ↦ nomatch (h.symm.trans wf.wikipediaHrefsSufficient)

theorem not_well_formed_of_wikipedia
    {s : SiteLinks.Site} (h : SiteLinks.noWikipedia s = false) :
    ¬ WellFormed s :=
  fun wf ↦ nomatch (h.symm.trans wf.noWikipedia)

-- Find equivalent: concrete Wikipedia URLs map to Grokipedia URLs.

theorem find_bitcoin :
    equivalent? "https://en.wikipedia.org/wiki/Bitcoin" =
      some "https://grokipedia.com/page/Bitcoin" := by
  native_decide

theorem find_bitcoin_http :
    equivalent? "http://en.wikipedia.org/wiki/Bitcoin" =
      some "https://grokipedia.com/page/Bitcoin" := by
  native_decide

theorem find_bitcoin_www :
    equivalent? "https://www.wikipedia.org/wiki/Bitcoin" =
      some "https://grokipedia.com/page/Bitcoin" := by
  native_decide

theorem find_bitcoin_mobile :
    equivalent? "https://en.m.wikipedia.org/wiki/Bitcoin" =
      some "https://grokipedia.com/page/Bitcoin" := by
  native_decide

theorem find_bitcoin_fragment :
    equivalent? "https://en.wikipedia.org/wiki/Bitcoin#History" =
      some "https://grokipedia.com/page/Bitcoin" := by
  native_decide

theorem find_russells_teapot :
    equivalent? "https://en.wikipedia.org/wiki/Russell's_teapot" =
      some "https://grokipedia.com/page/Russell's_teapot" := by
  native_decide

theorem find_russells_teapot_percent :
    equivalent? "https://en.wikipedia.org/wiki/Russell%27s_teapot" =
      some "https://grokipedia.com/page/Russell's_teapot" := by
  native_decide

theorem find_garden_of_eden :
    equivalent? "https://en.wikipedia.org/wiki/Garden_of_Eden" =
      some "https://grokipedia.com/page/Garden_of_Eden" := by
  native_decide

theorem find_garden_of_eden_percent_space :
    equivalent? "https://en.wikipedia.org/wiki/Garden%20of%20Eden" =
      some "https://grokipedia.com/page/Garden_of_Eden" := by
  native_decide

/-- Printed vocabulary href `enuma_elish_the_seven_tablets_of_creation`. -/
theorem find_printed_enuma_elish :
    equivalent?
        "https://en.wikipedia.org/wiki/enuma_elish_the_seven_tablets_of_creation" =
      some
        "https://grokipedia.com/page/enuma_elish_the_seven_tablets_of_creation" :=
  by
  native_decide

theorem grokipedia_url_is_not_wikipedia :
    equivalent? "https://grokipedia.com/page/Bitcoin" = none := by
  native_decide

theorem no_equivalent_empty_title :
    equivalent? "https://en.wikipedia.org/wiki/" = none := by
  native_decide

theorem no_equivalent_homepage :
    equivalent? "https://en.wikipedia.org/" = none := by
  native_decide

theorem no_equivalent_wikipedia_org_home :
    equivalent? "https://www.wikipedia.org/" = none := by
  native_decide

theorem no_equivalent_non_wiki_path :
    equivalent? "https://en.wikipedia.org/w/index.php" = none := by
  native_decide

theorem no_equivalent_special :
    equivalent? "https://en.wikipedia.org/wiki/Special:Search" = none := by
  native_decide

theorem no_equivalent_file :
    equivalent? "https://en.wikipedia.org/wiki/File:Example.jpg" = none := by
  native_decide

theorem no_equivalent_help :
    equivalent? "https://en.wikipedia.org/wiki/Help:Contents" = none := by
  native_decide

-- Insufficient: no equivalent, or an equivalent that is not an accepted page.

theorem empty_title_insufficient :
    status "https://en.wikipedia.org/wiki/" = .insufficient := by
  native_decide

theorem special_insufficient :
    status "https://en.wikipedia.org/wiki/Special:Search" = .insufficient := by
  native_decide

theorem unknown_title_has_equivalent :
    equivalent? "https://en.wikipedia.org/wiki/NotACitedTopic" =
      some "https://grokipedia.com/page/NotACitedTopic" := by
  native_decide

theorem unknown_title_insufficient :
    status "https://en.wikipedia.org/wiki/NotACitedTopic" = .insufficient := by
  native_decide

theorem bitcoin_status_sufficient :
    status "https://en.wikipedia.org/wiki/Bitcoin" =
      .sufficient "https://grokipedia.com/page/Bitcoin" := by
  native_decide

-- Fixtures are Lean literals. They are not public pages.

def fixtureUnknownHtml : String :=
  "<a href=\"https://en.wikipedia.org/wiki/NotACitedTopic\">x</a>"

def fixtureUnknown : SiteLinks.Site where
  html := fun
    | .home => fixtureUnknownHtml
    | _ => "<p></p>"

def fixtureBitcoinHtml : String :=
  "<a href=\"https://en.wikipedia.org/wiki/Bitcoin\">Bitcoin</a>"

def fixtureBitcoin : SiteLinks.Site where
  html := fun
    | .home => fixtureBitcoinHtml
    | _ => "<p></p>"

theorem fixture_unknown_insufficient :
    wikipediaHrefsSufficient fixtureUnknown = false := by
  native_decide

example : wellFormedBool fixtureUnknown = false := by
  native_decide

theorem fixture_unknown_not_well_formed : ¬ WellFormed fixtureUnknown :=
  not_well_formed_of_insufficient fixture_unknown_insufficient

theorem fixture_bitcoin_finds :
    equivalent? "https://en.wikipedia.org/wiki/Bitcoin" =
      some "https://grokipedia.com/page/Bitcoin" :=
  find_bitcoin

theorem fixture_bitcoin_wikipedia_hrefs_sufficient :
    wikipediaHrefsSufficient fixtureBitcoin = true := by
  native_decide

theorem fixture_bitcoin_prints_wikipedia :
    SiteLinks.noWikipedia fixtureBitcoin = false := by
  native_decide

example : wellFormedBool fixtureBitcoin = false := by
  native_decide

theorem fixture_bitcoin_not_well_formed : ¬ WellFormed fixtureBitcoin :=
  not_well_formed_of_wikipedia fixture_bitcoin_prints_wikipedia

-- Printed public pages: Grokipedia hrefs only, no Wikipedia.

theorem printed_accepted_contains_bitcoin :
    printedAccepted.contains "https://grokipedia.com/page/Bitcoin" = true := by
  native_decide

theorem printed_accepted_contains_russells_teapot :
    printedAccepted.contains "https://grokipedia.com/page/Russell's_teapot" =
      true := by
  native_decide

theorem printed_accepted_contains_garden_of_eden :
    printedAccepted.contains "https://grokipedia.com/page/Garden_of_Eden" =
      true := by
  native_decide

theorem printed_wikipedia_hrefs_sufficient :
    wikipediaHrefsSufficient SiteLinks.assertedSite = true := by
  native_decide

theorem printed_grokipedia_hrefs_are_pages :
    grokipediaHrefsArePages SiteLinks.assertedSite = true := by
  native_decide

theorem printed_no_wikipedia :
    SiteLinks.noWikipedia SiteLinks.assertedSite = true :=
  SiteLinks.no_wikipedia_links _ SiteLinks.asserted_links_well_formed

theorem site_grokipedia_spec : WellFormed SiteLinks.assertedSite where
  wikipediaHrefsSufficient := printed_wikipedia_hrefs_sufficient
  noWikipedia := printed_no_wikipedia
  grokipediaHrefsArePages := printed_grokipedia_hrefs_are_pages

theorem site_grokipedia_inhabited :
    Nonempty { s : SiteLinks.Site // WellFormed s } :=
  ⟨⟨SiteLinks.assertedSite, site_grokipedia_spec⟩⟩

example : wellFormedBool SiteLinks.assertedSite = true := by
  native_decide

end Grokipedia
