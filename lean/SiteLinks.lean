/-
  Encoded public links of surmount.systems (header nav and body hrefs).

  HTML remains the citation source for prose and scripture. This library
  `include_str`s each public page and `shared/nav.html`. A tiny parser collects
  quoted `href="..."` and `id="..."` values from those printed bytes. It does
  not rewrite visitor copy into Lean. It does not prove that God exists, that
  theism is proven, that grok-oss is an operating system, that Surmount will
  endure in the world, that an external URL returns HTTP 200, or that CSS and
  deploy are correct.

  In-site `*.html` targets must be public pages. `#fragment` and `page.html#id`
  must exist as `id` on the target page. `mailto:`, `javascript:`, empty hrefs,
  and wikipedia.org are ill-formed. `Grokipedia.lean` finds a Grokipedia
  equivalent for any Wikipedia href. If that equivalent cannot be formed, or
  Grokipedia is insufficient, the Grokipedia well-formed site is uninhabited.
  Public pages must use the Grokipedia URL. Copy assertions are structure
  fields, not custom Lean `axiom`s. There is no `sorry`.
-/

import SiteNav

namespace SiteLinks

set_option maxRecDepth 16384

/-- Quoted attribute values after `attr="`, in document order. Not HTML5. -/
def quotedValues (html : String) (attr : String) : List String :=
  match html.splitOn (attr ++ "=\"") with
  | [] => []
  | _ :: rest =>
      rest.map (fun tail ↦
        match tail.splitOn "\"" with
        | v :: _ => v
        | [] => "")

def hrefs (html : String) : List String := quotedValues html "href"

def ids (html : String) : List String := quotedValues html "id"

/-- `String.drop` / `String.take` return slices in Lean 4.33; copy back to `String`. -/
def dropNat (s : String) (n : Nat) : String :=
  (s.drop n).copy

def hasPref (s pre : String) : Bool :=
  s.startsWith pre

def hasSuf (s suf : String) : Bool :=
  s.endsWith suf

def takeUntilSlash (s : String) : String :=
  match s.splitOn "/" with
  | h :: _ => h
  | [] => s

def takeUntilColon (s : String) : String :=
  match s.splitOn ":" with
  | h :: _ => h
  | [] => s

def stripQuery (path : String) : String :=
  match path.splitOn "?" with
  | p :: _ => p
  | [] => path

/-- Host of an `http:` / `https:` URL; empty when the string is not that shape. -/
def hostOf (url : String) : String :=
  let rest :=
    if hasPref url "https://" then dropNat url 8
    else if hasPref url "http://" then dropNat url 7
    else ""
  if rest == "" then "" else takeUntilColon (takeUntilSlash rest)

def isWikipediaHost (host : String) : Bool :=
  host == "wikipedia.org" || host == "www.wikipedia.org" ||
    hasSuf host ".wikipedia.org"

/-- Classification of one `href` value. -/
inductive HrefClass where
  | empty
  | mailto
  | javascript
  | wikipedia
  | external
  | fragment (id : String)
  | publicPage (file : String)
  | publicPageFragment (file : String) (id : String)
  | otherRelative
  deriving DecidableEq, Repr

def classify (href : String) : HrefClass :=
  if href == "" then
    .empty
  else if hasPref href "mailto:" then
    .mailto
  else if hasPref href "javascript:" then
    .javascript
  else if hasPref href "#" then
    .fragment (dropNat href 1)
  else if hasPref href "https://" || hasPref href "http://" then
    if isWikipediaHost (hostOf href) then .wikipedia else .external
  else
    match href.splitOn "#" with
    | [] => .empty
    | path :: [] =>
        if hasSuf (stripQuery path) ".html" then .publicPage path
        else .otherRelative
    | path :: frag :: _ =>
        if hasSuf (stripQuery path) ".html" then
          .publicPageFragment path frag
        else
          .otherRelative

/-- Whether `href` on `source` resolves against the site's public pages and ids. -/
def hrefResolves (source : SiteNav.PublicPage)
    (idsOf : SiteNav.PublicPage → List String) (href : String) : Bool :=
  match classify href with
  | .empty | .mailto | .javascript | .wikipedia => false
  | .external | .otherRelative => true
  | .fragment id => !(id == "") && (idsOf source).contains id
  | .publicPage file => (SiteNav.ofHref? file).isSome
  | .publicPageFragment file id =>
      match SiteNav.ofHref? file with
      | some p => !(id == "") && (idsOf p).contains id
      | none => false

/-- Printed public pages. Paths are relative to this file (site root is `../`). -/
def site_index_html : String := include_str "../index.html"
def site_philosophy_html : String := include_str "../philosophy.html"
def site_faith_html : String := include_str "../faith.html"
def site_vocabulary_html : String := include_str "../vocabulary.html"
def site_projects_html : String := include_str "../projects.html"
def site_contributors_html : String := include_str "../contributors.html"
def site_support_html : String := include_str "../support.html"
def site_contact_html : String := include_str "../contact.html"
def site_shared_nav_html : String := include_str "../shared/nav.html"

/-- Encoded site: the printed HTML of each public page. -/
structure Site where
  html : SiteNav.PublicPage → String

def pageHtml : SiteNav.PublicPage → String
  | .home => site_index_html
  | .philosophy => site_philosophy_html
  | .faith => site_faith_html
  | .vocabulary => site_vocabulary_html
  | .projects => site_projects_html
  | .contributors => site_contributors_html
  | .support => site_support_html
  | .contact => site_contact_html

def assertedSite : Site where
  html := pageHtml

def hrefsOf (s : Site) (p : SiteNav.PublicPage) : List String :=
  hrefs (s.html p)

def idsOf (s : Site) (p : SiteNav.PublicPage) : List String :=
  ids (s.html p)

def pageHrefsResolve (s : Site) (p : SiteNav.PublicPage) : Bool :=
  (hrefsOf s p).all (fun h ↦ hrefResolves p (idsOf s) h)

def allHrefsResolve (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦ pageHrefsResolve s p)

def noWikipedia (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦
    (hrefsOf s p).all (fun h ↦ classify h != .wikipedia))

def noMailto (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦
    (hrefsOf s p).all (fun h ↦ classify h != .mailto))

def noJavascript (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦
    (hrefsOf s p).all (fun h ↦ classify h != .javascript))

def noEmptyHref (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦
    (hrefsOf s p).all (fun h ↦ classify h != .empty))

def idsUniqueOnEachPage (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦ SiteNav.hasDuplicate (idsOf s p) == false)

def navHrefsPresent (s : Site) : Bool :=
  SiteNav.allPages.all (fun p ↦
    SiteNav.printedHrefs.all (fun h ↦ (hrefsOf s p).contains h))

/-- Well-formed public links: every in-site target on the printed HTML resolves. -/
structure WellFormed (s : Site) : Prop where
  everyHrefResolves : allHrefsResolve s = true
  noWikipedia : noWikipedia s = true
  noMailto : noMailto s = true
  noJavascript : noJavascript s = true
  noEmptyHref : noEmptyHref s = true
  idsUniqueOnEachPage : idsUniqueOnEachPage s = true
  navHrefsPresent : navHrefsPresent s = true
  sharedNavFileEqSiteNav : site_shared_nav_html = SiteNav.site_nav_html

-- Parser fixtures: a bad link is a failed theorem.

theorem quoted_values_href :
    quotedValues "<a href=\"faith.html\">x</a>" "href" = ["faith.html"] := by
  native_decide

theorem quoted_values_id :
    quotedValues "<h3 id=\"sin\">Sin</h3>" "id" = ["sin"] := by
  native_decide

theorem quoted_values_two_hrefs :
    quotedValues "<a href=\"a.html\"></a><a href=\"b.html\"></a>" "href" =
      ["a.html", "b.html"] := by
  native_decide

theorem classify_public_page :
    classify "faith.html" = .publicPage "faith.html" := by
  native_decide

theorem classify_fragment : classify "#sin" = .fragment "sin" := by
  native_decide

theorem classify_page_fragment :
    classify "vocabulary.html#sin" =
      .publicPageFragment "vocabulary.html" "sin" := by
  native_decide

theorem classify_css_query : classify "styles.css?v=8" = .otherRelative := by
  native_decide

theorem classify_https_html_is_external :
    classify "https://bip360.org/bip360.html" = .external := by
  native_decide

theorem classify_wikipedia :
    classify "https://en.wikipedia.org/wiki/X" = .wikipedia := by
  native_decide

theorem classify_mailto : classify "mailto:x@y.z" = .mailto := by
  native_decide

theorem classify_javascript : classify "javascript:void(0)" = .javascript := by
  native_decide

theorem classify_empty : classify "" = .empty := by
  native_decide

theorem wikipedia_href_does_not_resolve :
    hrefResolves .home (fun _ ↦ []) "https://en.wikipedia.org/wiki/X" =
      false := by
  native_decide

theorem mailto_href_does_not_resolve :
    hrefResolves .contact (fun _ ↦ []) "mailto:x@y.z" = false := by
  native_decide

theorem missing_fragment_does_not_resolve :
    hrefResolves .vocabulary (fun _ ↦ ["sin"]) "#nope" = false := by
  native_decide

theorem missing_page_does_not_resolve :
    hrefResolves .home (fun _ ↦ []) "about.html" = false := by
  native_decide

theorem missing_page_fragment_does_not_resolve :
    hrefResolves .home (fun _ ↦ ["sin"]) "missing.html#sin" = false := by
  native_decide

theorem empty_fragment_does_not_resolve :
    hrefResolves .vocabulary (fun _ ↦ ["sin"]) "#" = false := by
  native_decide

theorem public_page_resolves :
    hrefResolves .home (fun _ ↦ []) "faith.html" = true := by
  native_decide

theorem same_page_fragment_resolves :
    hrefResolves .vocabulary (fun | .vocabulary => ["sin"] | _ => []) "#sin" =
      true := by
  native_decide

theorem cross_page_fragment_resolves :
    hrefResolves .faith (fun | .vocabulary => ["humility"] | _ => [])
        "vocabulary.html#humility" = true := by
  native_decide

theorem grokipedia_is_not_wikipedia :
    classify "https://grokipedia.com/page/Bitcoin" = .external := by
  native_decide

theorem host_of_https :
    hostOf "https://en.wikipedia.org/wiki/X" = "en.wikipedia.org" := by
  native_decide

theorem shared_nav_hrefs :
    hrefs SiteNav.site_nav_html = SiteNav.printedHrefs := by
  native_decide

theorem printed_shared_nav_hrefs :
    hrefs site_shared_nav_html = SiteNav.printedHrefs := by
  native_decide

theorem page_nav_hrefs_eq_printed (p : SiteNav.PublicPage) :
    hrefs (SiteNav.pageNavHtml p) = SiteNav.printedHrefs :=
  match p with
  | .home => by native_decide
  | .philosophy => by native_decide
  | .faith => by native_decide
  | .vocabulary => by native_decide
  | .projects => by native_decide
  | .contributors => by native_decide
  | .support => by native_decide
  | .contact => by native_decide

theorem asserted_links_well_formed : WellFormed assertedSite where
  everyHrefResolves := by native_decide
  noWikipedia := by native_decide
  noMailto := by native_decide
  noJavascript := by native_decide
  noEmptyHref := by native_decide
  idsUniqueOnEachPage := by native_decide
  navHrefsPresent := by native_decide
  sharedNavFileEqSiteNav := by native_decide

theorem every_in_site_href_resolves (s : Site) (h : WellFormed s) :
    allHrefsResolve s = true :=
  h.everyHrefResolves

theorem no_wikipedia_links (s : Site) (h : WellFormed s) :
    noWikipedia s = true :=
  h.noWikipedia

theorem no_mailto_links (s : Site) (h : WellFormed s) :
    noMailto s = true :=
  h.noMailto

theorem no_javascript_links (s : Site) (h : WellFormed s) :
    noJavascript s = true :=
  h.noJavascript

theorem no_empty_hrefs (s : Site) (h : WellFormed s) :
    noEmptyHref s = true :=
  h.noEmptyHref

theorem ids_unique_on_each_page (s : Site) (h : WellFormed s) :
    idsUniqueOnEachPage s = true :=
  h.idsUniqueOnEachPage

theorem nav_hrefs_are_public_pages (s : Site) (h : WellFormed s) :
    navHrefsPresent s = true :=
  h.navHrefsPresent

theorem printed_shared_nav_eq_sitenav (s : Site) (h : WellFormed s) :
    site_shared_nav_html = SiteNav.site_nav_html :=
  h.sharedNavFileEqSiteNav

theorem site_links_consistent : WellFormed assertedSite :=
  asserted_links_well_formed

theorem site_links_inhabited : Nonempty { s : Site // WellFormed s } :=
  ⟨⟨assertedSite, asserted_links_well_formed⟩⟩

end SiteLinks
