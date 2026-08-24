/-
  Encoded public nav tree of surmount.systems.

  `shared/nav.html` is the template. Each public page's printed HTML is also
  source (`include_str`, same relative paths as SiteLinks). This library does
  not prove that God exists, that theism is proven, that grok-oss is an
  operating system, or that Surmount will endure in the world. It extracts the
  printed `<nav>` from those bytes and proves that extract equals `renderNav`
  (canonical tree plus `aria-current="page"` on that page's link), and that the
  hierarchical-nav law holds (two in-flow rows, not a dropdown). Copy
  assertions are structure fields, not custom Lean `axiom`s. There is no
  `sorry`.
-/

namespace SiteNav

-- The shared fragment is ~700 bytes; string `rfl` walks it.
set_option maxRecDepth 8192

/-- The eight public pages named by `href="*.html"` in `shared/nav.html`. -/
inductive PublicPage where
  | home
  | philosophy
  | faith
  | vocabulary
  | projects
  | contributors
  | support
  | contact
  deriving BEq, DecidableEq, Repr

/-- href of each public page, matching `shared/nav.html`. -/
def PublicPage.href : PublicPage → String
  | .home => "index.html"
  | .philosophy => "philosophy.html"
  | .faith => "faith.html"
  | .vocabulary => "vocabulary.html"
  | .projects => "projects.html"
  | .contributors => "contributors.html"
  | .support => "support.html"
  | .contact => "contact.html"

/-- Visible link label of each public page, matching `shared/nav.html`. -/
def PublicPage.label : PublicPage → String
  | .home => "Home"
  | .philosophy => "Philosophy"
  | .faith => "Faith"
  | .vocabulary => "Vocabulary"
  | .projects => "Projects"
  | .contributors => "Contributors"
  | .support => "Support"
  | .contact => "Contact"

/-- Inverse of `PublicPage.href` on the printed href set; `none` off that set. -/
def ofHref? : String → Option PublicPage
  | "index.html" => some .home
  | "philosophy.html" => some .philosophy
  | "faith.html" => some .faith
  | "vocabulary.html" => some .vocabulary
  | "projects.html" => some .projects
  | "contributors.html" => some .contributors
  | "support.html" => some .support
  | "contact.html" => some .contact
  | _ => none

/-- Encoded nav tree. `children` is the second in-flow row under a top-row page. -/
structure Nav where
  topRow : List PublicPage
  children : PublicPage → List PublicPage

/-- Document-order page list: each top-row page, then its children, matching href order. -/
def preorder (n : Nav) : List PublicPage :=
  n.topRow.foldr (fun p acc ↦ p :: n.children p ++ acc) []

/-- Pages that appear as children of the top row (the second row, across sections). -/
def childPages (n : Nav) : List PublicPage :=
  n.topRow.foldr (fun p acc ↦ n.children p ++ acc) []

/--
  Section parent of a page: the top-row item whose nested list contains the
  current `aria-current="page"` link. Home is its own section and has no nested
  list. This is the encoded-tree form of
  `nav > ul > li:has([aria-current="page"]) > ul`, not a CSS parser.
-/
def sectionOf : PublicPage → PublicPage
  | .faith | .vocabulary => .philosophy
  | .contributors => .projects
  | .contact => .support
  | p => p

/-- Second in-flow row shown while `current` is the page (empty on Home). -/
def secondRow (n : Nav) (current : PublicPage) : List PublicPage :=
  n.children (sectionOf current)

/-- Fixed indents used in `shared/nav.html`. Literals so `rfl` does not recurse. -/
def pad : Nat → String
  | 6 => "      "
  | 8 => "        "
  | 10 => "          "
  | 12 => "            "
  | 14 => "              "
  | _ => ""

def joinStrings : List String → String
  | [] => ""
  | s :: ss => s ++ joinStrings ss

def hasDuplicate {α : Type} [BEq α] : List α → Bool
  | [] => false
  | x :: xs => xs.contains x || hasDuplicate xs

/-- `aria-current="page"` on the matching link; empty on the template (`none`). -/
def currentAttr (p : PublicPage) : Option PublicPage → String
  | none => ""
  | some c => if c == p then " aria-current=\"page\"" else ""

def renderAnchor (p : PublicPage) (current : Option PublicPage) : String :=
  "<a href=\"" ++ p.href ++ "\"" ++ currentAttr p current ++ ">" ++ p.label ++ "</a>"

def renderLeafLi (indent : Nat) (p : PublicPage) (current : Option PublicPage) : String :=
  pad indent ++ "<li>" ++ renderAnchor p current ++ "</li>\n"

def renderBranchLi (p : PublicPage) (kids : List PublicPage) (current : Option PublicPage) :
    String :=
  pad 10 ++ "<li>\n" ++ pad 12 ++ renderAnchor p current ++ "\n" ++
    pad 12 ++ "<ul>\n" ++
      joinStrings (kids.map (fun c ↦ renderLeafLi 14 c current)) ++
    pad 12 ++ "</ul>\n" ++ pad 10 ++ "</li>\n"

def renderTopLi (n : Nav) (p : PublicPage) (current : Option PublicPage) : String :=
  match n.children p with
  | [] => renderLeafLi 10 p current
  | kids => renderBranchLi p kids current

/-- Pretty-printer. Pass `none` for the shared template; `some page` for that page's nav. -/
def renderNav (n : Nav) (current : Option PublicPage) : String :=
  pad 6 ++ "<nav>\n" ++ pad 8 ++ "<ul>\n" ++
    joinStrings (n.topRow.map (fun p ↦ renderTopLi n p current)) ++
    pad 8 ++ "</ul>\n" ++ pad 6 ++ "</nav>\n"

/-- Last element of a string list; empty list is `""`. -/
def lastString : List String → String
  | [] => ""
  | [x] => x
  | _ :: xs => lastString xs

/-- Indent immediately before the first `<nav>` (spaces after the last newline). -/
def trailingSpaces (s : String) : String :=
  lastString (s.splitOn "\n")

/--
  The first `<nav>...</nav>` block, including the indent before `<nav>` and a
  trailing newline. Not HTML5. A later `aria-current` in body copy is ignored.
-/
def extractNav (html : String) : String :=
  match html.splitOn "<nav>" with
  | before :: after :: _ =>
    match after.splitOn "</nav>" with
    | inner :: _ => trailingSpaces before ++ "<nav>" ++ inner ++ "</nav>\n"
    | [] => ""
  | _ => ""

-- Parser fixtures: a bad extract is a failed theorem.

theorem extract_nav_keeps_indent_and_inner :
    extractNav "pre\n      <nav>\n        inner\n      </nav>\npost" =
      "      <nav>\n        inner\n      </nav>\n" := by
  native_decide

theorem extract_nav_stops_at_first_close :
    extractNav "<nav>A</nav><p>aria-current=\"page\"</p>" = "<nav>A</nav>\n" := by
  native_decide

theorem extract_nav_missing : extractNav "no nav here" = "" := by
  native_decide

/-- Public pages in `shared/nav.html` href order (depth-first). -/
def allPages : List PublicPage :=
  [.home, .philosophy, .faith, .vocabulary, .projects, .contributors, .support,
    .contact]

def printedHrefs : List String :=
  allPages.map PublicPage.href

def printedLabels : List String :=
  allPages.map PublicPage.label

/--
  Printed `shared/nav.html` (LF, six-space base indent, trailing newline).
  `include_str` of the file; not a second copy-paste of the fragment.
-/
def site_nav_html : String := include_str "../shared/nav.html"

/-- The live public nav tree, as a model. These values are asserted, not proven. -/
def assertedNav : Nav where
  topRow := [.home, .philosophy, .projects, .support]
  children := fun
    | .philosophy => [.faith, .vocabulary]
    | .projects => [.contributors]
    | .support => [.contact]
    | _ => []

/-- Well-formed public nav: hierarchical two-row law, with no duplicate pages. -/
structure WellFormed (n : Nav) : Prop where
  topRowEq : n.topRow = [.home, .philosophy, .projects, .support]
  homeHasNoChildren : n.children .home = []
  philosophyChildren : n.children .philosophy = [.faith, .vocabulary]
  projectsChildren : n.children .projects = [.contributors]
  supportChildren : n.children .support = [.contact]
  faithHasNoChildren : n.children .faith = []
  vocabularyHasNoChildren : n.children .vocabulary = []
  contributorsHaveNoChildren : n.children .contributors = []
  contactHasNoChildren : n.children .contact = []
  preorderEq : preorder n = allPages
  hrefsEq : List.map PublicPage.href (preorder n) = printedHrefs
  labelsEq : List.map PublicPage.label (preorder n) = printedLabels
  uniquePages : hasDuplicate (preorder n) = false
  uniqueHrefs : hasDuplicate (List.map PublicPage.href (preorder n)) = false
  topNotChildren : n.topRow.all (fun p ↦ !(childPages n).contains p) = true
  childrenNotTop : (childPages n).all (fun p ↦ !n.topRow.contains p) = true

theorem asserted_nav_well_formed : WellFormed assertedNav where
  topRowEq := rfl
  homeHasNoChildren := rfl
  philosophyChildren := rfl
  projectsChildren := rfl
  supportChildren := rfl
  faithHasNoChildren := rfl
  vocabularyHasNoChildren := rfl
  contributorsHaveNoChildren := rfl
  contactHasNoChildren := rfl
  preorderEq := rfl
  hrefsEq := rfl
  labelsEq := rfl
  uniquePages := rfl
  uniqueHrefs := rfl
  topNotChildren := rfl
  childrenNotTop := rfl

theorem ofHref_href (p : PublicPage) : ofHref? p.href = some p :=
  match p with
  | .home => rfl
  | .philosophy => rfl
  | .faith => rfl
  | .vocabulary => rfl
  | .projects => rfl
  | .contributors => rfl
  | .support => rfl
  | .contact => rfl

/-- Distinct pages have distinct hrefs; the href map is a bijection onto its image. -/
theorem href_injective (p q : PublicPage) (h : p.href = q.href) : p = q := by
  injection (ofHref_href p).symm.trans ((congrArg ofHref? h).trans (ofHref_href q))

theorem printed_hrefs_eq_source_list :
    printedHrefs =
      ["index.html", "philosophy.html", "faith.html", "vocabulary.html",
        "projects.html", "contributors.html", "support.html", "contact.html"] :=
  rfl

theorem printed_labels_eq_source_list :
    printedLabels =
      ["Home", "Philosophy", "Faith", "Vocabulary", "Projects", "Contributors",
        "Support", "Contact"] :=
  rfl

/-- Printed hrefs decode to exactly the eight public pages, in document order. -/
theorem printed_hrefs_decode_to_all_pages :
    printedHrefs.filterMap ofHref? = allPages :=
  rfl

theorem every_public_page_is_in_href_set (p : PublicPage) :
    printedHrefs.contains p.href = true :=
  match p with
  | .home => rfl
  | .philosophy => rfl
  | .faith => rfl
  | .vocabulary => rfl
  | .projects => rfl
  | .contributors => rfl
  | .support => rfl
  | .contact => rfl

theorem every_public_page_is_in_preorder (p : PublicPage) :
    (preorder assertedNav).contains p = true :=
  match p with
  | .home => rfl
  | .philosophy => rfl
  | .faith => rfl
  | .vocabulary => rfl
  | .projects => rfl
  | .contributors => rfl
  | .support => rfl
  | .contact => rfl

/-- Combined: the href set is exactly the eight public pages; there are no extras. -/
theorem public_pages_are_exactly_the_href_set (n : Nav) (h : WellFormed n) :
    List.map PublicPage.href (preorder n) = printedHrefs ∧
      printedHrefs.filterMap ofHref? = allPages ∧
      preorder n = allPages :=
  ⟨h.hrefsEq, printed_hrefs_decode_to_all_pages, h.preorderEq⟩

theorem top_row_is_home_philosophy_projects_support (n : Nav) (h : WellFormed n) :
    n.topRow = [.home, .philosophy, .projects, .support] :=
  h.topRowEq

theorem top_row_labels (n : Nav) (h : WellFormed n) :
    n.topRow.map PublicPage.label = ["Home", "Philosophy", "Projects", "Support"] :=
  h.topRowEq ▸ rfl

theorem home_has_no_children (n : Nav) (h : WellFormed n) :
    n.children .home = [] :=
  h.homeHasNoChildren

theorem home_second_row_empty (n : Nav) (h : WellFormed n) :
    secondRow n .home = [] :=
  h.homeHasNoChildren

theorem philosophy_children_are_faith_and_vocabulary (n : Nav) (h : WellFormed n) :
    n.children .philosophy = [.faith, .vocabulary] :=
  h.philosophyChildren

theorem projects_children_are_contributors (n : Nav) (h : WellFormed n) :
    n.children .projects = [.contributors] :=
  h.projectsChildren

theorem support_children_are_contact (n : Nav) (h : WellFormed n) :
    n.children .support = [.contact] :=
  h.supportChildren

/-- Second row on a Philosophy-section page is Faith and Vocabulary. -/
theorem philosophy_section_second_row (n : Nav) (h : WellFormed n) (p : PublicPage)
    (hp : sectionOf p = .philosophy) :
    secondRow n p = [.faith, .vocabulary] :=
  (congrArg n.children hp).trans h.philosophyChildren

theorem philosophy_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .philosophy = [.faith, .vocabulary] :=
  h.philosophyChildren

theorem faith_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .faith = [.faith, .vocabulary] :=
  h.philosophyChildren

theorem vocabulary_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .vocabulary = [.faith, .vocabulary] :=
  h.philosophyChildren

theorem projects_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .projects = [.contributors] :=
  h.projectsChildren

theorem contributors_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .contributors = [.contributors] :=
  h.projectsChildren

theorem support_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .support = [.contact] :=
  h.supportChildren

theorem contact_page_second_row (n : Nav) (h : WellFormed n) :
    secondRow n .contact = [.contact] :=
  h.supportChildren

theorem second_row_is_section_children (n : Nav) (p : PublicPage) :
    secondRow n p = n.children (sectionOf p) :=
  rfl

/-- Children of children are empty: the tree is two levels, not three. -/
theorem children_of_children_empty (n : Nav) (h : WellFormed n) :
    n.children .faith = [] ∧ n.children .vocabulary = [] ∧
      n.children .contributors = [] ∧ n.children .contact = [] :=
  ⟨h.faithHasNoChildren, h.vocabularyHasNoChildren,
    h.contributorsHaveNoChildren, h.contactHasNoChildren⟩

/-- Depth-first walk: no grandchild lists under any public page. -/
theorem asserted_no_grandchildren :
    allPages.all (fun p ↦
      (assertedNav.children p).all (fun q ↦
        (assertedNav.children q).isEmpty)) = true :=
  rfl

theorem unique_pages (n : Nav) (h : WellFormed n) :
    hasDuplicate (preorder n) = false :=
  h.uniquePages

theorem unique_hrefs (n : Nav) (h : WellFormed n) :
    hasDuplicate (List.map PublicPage.href (preorder n)) = false :=
  h.uniqueHrefs

theorem no_page_is_both_top_and_child (n : Nav) (h : WellFormed n) :
    n.topRow.all (fun p ↦ !(childPages n).contains p) = true ∧
      (childPages n).all (fun p ↦ !n.topRow.contains p) = true :=
  ⟨h.topNotChildren, h.childrenNotTop⟩

theorem every_page_reachable_once (n : Nav) (h : WellFormed n) :
    preorder n = allPages ∧ hasDuplicate (preorder n) = false :=
  ⟨h.preorderEq, h.uniquePages⟩

/-- The pretty-printer of the asserted tree is the shared fragment, byte for byte. -/
theorem asserted_rendered_nav_eq_shared_fragment :
    renderNav assertedNav none = site_nav_html :=
  rfl

/-- The shared template file is exactly one `<nav>` block; extract is identity. -/
theorem extract_nav_of_shared_template :
    extractNav site_nav_html = site_nav_html := by
  native_decide

/--
  Extracted `<nav>` from each public page (`include_str` of the printed HTML).
  `aria-current="page"` is on that page's link. If a page drifts, the matching
  equality with `renderNav` fails.
-/
def site_nav_index_html : String := extractNav (include_str "../index.html")
def site_nav_philosophy_html : String :=
  extractNav (include_str "../philosophy.html")
def site_nav_faith_html : String := extractNav (include_str "../faith.html")
def site_nav_vocabulary_html : String :=
  extractNav (include_str "../vocabulary.html")
def site_nav_projects_html : String := extractNav (include_str "../projects.html")
def site_nav_contributors_html : String :=
  extractNav (include_str "../contributors.html")
def site_nav_support_html : String := extractNav (include_str "../support.html")
def site_nav_contact_html : String := extractNav (include_str "../contact.html")

/-- Printed page navs, indexed by the public page. -/
def pageNavHtml : PublicPage → String
  | .home => site_nav_index_html
  | .philosophy => site_nav_philosophy_html
  | .faith => site_nav_faith_html
  | .vocabulary => site_nav_vocabulary_html
  | .projects => site_nav_projects_html
  | .contributors => site_nav_contributors_html
  | .support => site_nav_support_html
  | .contact => site_nav_contact_html

theorem site_nav_index_eq_render :
    renderNav assertedNav (some .home) = site_nav_index_html := by
  native_decide

theorem site_nav_philosophy_eq_render :
    renderNav assertedNav (some .philosophy) = site_nav_philosophy_html := by
  native_decide

theorem site_nav_faith_eq_render :
    renderNav assertedNav (some .faith) = site_nav_faith_html := by
  native_decide

theorem site_nav_vocabulary_eq_render :
    renderNav assertedNav (some .vocabulary) = site_nav_vocabulary_html := by
  native_decide

theorem site_nav_projects_eq_render :
    renderNav assertedNav (some .projects) = site_nav_projects_html := by
  native_decide

theorem site_nav_contributors_eq_render :
    renderNav assertedNav (some .contributors) = site_nav_contributors_html := by
  native_decide

theorem site_nav_support_eq_render :
    renderNav assertedNav (some .support) = site_nav_support_html := by
  native_decide

theorem site_nav_contact_eq_render :
    renderNav assertedNav (some .contact) = site_nav_contact_html := by
  native_decide

/-- Every public page's printed `<nav>` is the asserted tree with that page current. -/
theorem every_page_nav_eq_render (p : PublicPage) :
    renderNav assertedNav (some p) = pageNavHtml p :=
  match p with
  | .home => site_nav_index_eq_render
  | .philosophy => site_nav_philosophy_eq_render
  | .faith => site_nav_faith_eq_render
  | .vocabulary => site_nav_vocabulary_eq_render
  | .projects => site_nav_projects_eq_render
  | .contributors => site_nav_contributors_eq_render
  | .support => site_nav_support_eq_render
  | .contact => site_nav_contact_eq_render

theorem site_nav_consistent : WellFormed assertedNav :=
  asserted_nav_well_formed

theorem site_nav_inhabited : Nonempty { n : Nav // WellFormed n } :=
  ⟨⟨assertedNav, asserted_nav_well_formed⟩⟩

end SiteNav
