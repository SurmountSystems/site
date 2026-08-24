/-
  Original Douay-Rheims quotations used on surmount.systems.

  Words are the unmodified historic translation (OT Douay 1609, NT Rheims 1582),
  not King James and not Challoner. This file does not prove that God exists.
  It proves that the site quotations equal the source strings, and that each
  warranted vocabulary term has a `Warrant`: one named verse, or a named verse
  pair. Humility is the verse pair. The three one-verse terms remain in
  bijection with those three citations (the one-verse fragment, not the whole
  warrant story).
-/

namespace DouayRheims

/--
  Public citation. Dataset:
  https://github.com/cryptoquick/original-douay-rheims (accessed: 2026-08-19).
-/
def source_citation : String :=
  "Original Douay-Rheims. Old Testament, English College of Douay, 1609. " ++
    "New Testament, English College of Rheims, 1582."

/-- Genesis 3:24, `bible/raw/genesis.json`, verbatim. -/
def genesis_3_24 : String :=
  "And he cast out Adam, and placed before the Paradise of pleasure Cherubins, " ++
    "and a flaming and a turning sword, for to keep the way of the tree of life."

/-- Exodus 20:16, `bible/raw/exodus.json`, verbatim. -/
def exodus_20_16 : String :=
  "Thou shalt not speak against thy neighbour false testimony."

/-- Matthew 5:9, `bible/raw/matthew.json`, verbatim. -/
def matthew_5_9 : String :=
  "Blessed are the peace-makers: for they shall be called the children of God."

/-- Matthew 11:29, `bible/raw/matthew.json`, verbatim. -/
def matthew_11_29 : String :=
  "Take up my yoke upon you, and learn of me, because I am meek, and humble of heart: " ++
    "and you shall find rest to your souls."

/-- Philippians 2:3, `bible/raw/philippians.json`, verbatim. -/
def philippians_2_3 : String :=
  "Nothing by contention, neither by vain glory: but in humility, each counting " ++
    "other better than themselves:"

/--
  Printed Exodus 20:1-15 and 20:17, `bible/raw/exodus.json`, verbatim.
  These are the rest of the Vocabulary block. They are not new one-verse
  warrants. Exodus 20:16 stays the false-testimony pairing above.
-/
def exodus_20_1 : String :=
  "And our Lord spake all these words."

def exodus_20_2 : String :=
  "I am the Lord thy God, which brought thee forth out of the Land of " ++
    "Ægypt, out of the house of servitude."

def exodus_20_3 : String :=
  "Thou shalt not have strange gods before me."

def exodus_20_4 : String :=
  "Thou shalt not make to thee a graven thing, nor any similitude that " ++
    "is in heaven above, & that is in the earth beneath, neither of " ++
    "those things that are in the waters under the earth."

def exodus_20_5 : String :=
  "Thou shalt not adore them, nor serve them: I am the Lord thy God " ++
    "mighty, jealous, visiting the iniquity of the fathers upon the " ++
    "children, upon the third and fourth generation of them that hate " ++
    "me:"

def exodus_20_6 : String :=
  "and doing mercy upon thousands to them that love me, and keep my " ++
    "precepts."

def exodus_20_7 : String :=
  "Thou shalt not take the name of the Lord thy God in vain. For the " ++
    "Lord will not hold him innocent that shall take the name of the " ++
    "Lord his God vainly."

def exodus_20_8 : String :=
  "Remember that thou sanctify the Sabbath day."

def exodus_20_9 : String :=
  "Six days shalt thou work, and shalt do all thy works."

def exodus_20_10 : String :=
  "But on the seventh day is the sabbath of the Lord thy God: thou " ++
    "shalt do no work in it, thou and thy son, and thy daughter, thy man " ++
    "servant, and thy woman servant, thy beast, and the stranger that is " ++
    "within thy gates."

def exodus_20_11 : String :=
  "For six days the Lord made heaven and earth, and the sea, and all " ++
    "things that are in them, and rested in the seventh day, therefore " ++
    "the Lord blessed the sabbath day, and sanctified it."

def exodus_20_12 : String :=
  "Honour thy father and thy mother, that thou mayst be long lived " ++
    "upon the earth, which the Lord thy God will give thee."

def exodus_20_13 : String :=
  "Thou shalt not murder."

def exodus_20_14 : String :=
  "Thou shalt not commit adultery."

def exodus_20_15 : String :=
  "Thou shalt not steal."

def exodus_20_17 : String :=
  "Thou shalt not covet thy neighbour's house: neither shalt thou " ++
    "desire his wife, nor servant, nor handmaid, nor ox, nor ass, nor " ++
    "any thing that is his."

/--
  Printed Matthew 5:3-8 and 5:10-12, `bible/raw/matthew.json`, verbatim.
  These are the rest of the Vocabulary Beatitude block. They are not new
  one-verse warrants. Matthew 5:9 stays the peace-makers pairing above.
-/
def matthew_5_3 : String :=
  "Blessed are the poor in spirit: for theirs is the Kingdom of Heaven."

def matthew_5_4 : String :=
  "Blessed are the meek: for they shall possess the land."

def matthew_5_5 : String :=
  "Blessed are they that mourn: for they shall be comforted."

def matthew_5_6 : String :=
  "Blessed are they that hunger and thirst after justice: for they " ++
    "shall have their fill."

def matthew_5_7 : String :=
  "Blessed are the merciful: for they shall obtain mercy."

def matthew_5_8 : String :=
  "Blessed are the clean of heart: for they shall see God."

def matthew_5_10 : String :=
  "Blessed are they that suffer persecution for justice: for theirs is " ++
    "the Kingdom of Heaven."

def matthew_5_11 : String :=
  "Blessed are ye when they shall revile you, and persecute you, " ++
    "& speak all that naught is against you, untruly, for my sake:"

def matthew_5_12 : String :=
  "be glad & rejoice, for your reward is very great in Heaven. For so " ++
    "they persecuted the Prophets, that were before you."

/--
  Printed honest-weights verses, `bible/raw`, verbatim.
  These are not one-verse warrants. The three one-verse terms remain
  false testimony, peace-makers, and Cherubins.
-/
def leviticus_19_35 : String :=
  "Do not any unjust thing in judgment, in rule, in weight, or measure."

def leviticus_19_36 : String :=
  "Let the balance be just, and the weights equal, the bushel just, and the " ++
    "sextary equal. I the Lord your God, that brought you out of the Land of " ++
    "Ægypt."

def deuteronomy_25_13 : String :=
  "Thou shalt not have diverse weights in thy bag, a greater and a less:"

def deuteronomy_25_14 : String :=
  "neither shall there be in thy house a greater bushel and a less."

def deuteronomy_25_15 : String :=
  "Thou shalt have a weight just and true, and thy bushel shall be equal and " ++
    "true: that thou mayest live a long time upon the Land, which our Lord " ++
    "thy God shall give thee."

def proverbs_11_1 : String :=
  "Adeceitful balance, is abomination before God: and an equal weight is his will."

/--
  Printed jubilee verses, `bible/raw/leviticus.json`, verbatim.
  These are not one-verse warrants. They are not a 1971 dating of the dollar.
-/
def leviticus_25_8 : String :=
  "Thou shalt number thee also seven weeks of years, that is to say, seven " ++
    "times seven, which together make forty-nine, years:"

def leviticus_25_10 : String :=
  "Thou shalt sanctify the fiftieth year, and shalt proclaim remission to all " ++
    "the inhabitants of thy land: for it is the year of Jubilee. Every man " ++
    "shall return to his possession, & every one shall go back to his old family:"

def leviticus_25_13 : String :=
  "In the year of Jubilee all shall return to their possessions."

/-- The same strings as printed on Faith and Vocabulary. -/
def site_genesis_3_24 : String := genesis_3_24
def site_exodus_20_1 : String := exodus_20_1
def site_exodus_20_2 : String := exodus_20_2
def site_exodus_20_3 : String := exodus_20_3
def site_exodus_20_4 : String := exodus_20_4
def site_exodus_20_5 : String := exodus_20_5
def site_exodus_20_6 : String := exodus_20_6
def site_exodus_20_7 : String := exodus_20_7
def site_exodus_20_8 : String := exodus_20_8
def site_exodus_20_9 : String := exodus_20_9
def site_exodus_20_10 : String := exodus_20_10
def site_exodus_20_11 : String := exodus_20_11
def site_exodus_20_12 : String := exodus_20_12
def site_exodus_20_13 : String := exodus_20_13
def site_exodus_20_14 : String := exodus_20_14
def site_exodus_20_15 : String := exodus_20_15
def site_exodus_20_16 : String := exodus_20_16
def site_exodus_20_17 : String := exodus_20_17
def site_matthew_5_3 : String := matthew_5_3
def site_matthew_5_4 : String := matthew_5_4
def site_matthew_5_5 : String := matthew_5_5
def site_matthew_5_6 : String := matthew_5_6
def site_matthew_5_7 : String := matthew_5_7
def site_matthew_5_8 : String := matthew_5_8
def site_matthew_5_9 : String := matthew_5_9
def site_matthew_5_10 : String := matthew_5_10
def site_matthew_5_11 : String := matthew_5_11
def site_matthew_5_12 : String := matthew_5_12
def site_matthew_11_29 : String := matthew_11_29
def site_philippians_2_3 : String := philippians_2_3
def site_leviticus_19_35 : String := leviticus_19_35
def site_leviticus_19_36 : String := leviticus_19_36
def site_deuteronomy_25_13 : String := deuteronomy_25_13
def site_deuteronomy_25_14 : String := deuteronomy_25_14
def site_deuteronomy_25_15 : String := deuteronomy_25_15
def site_proverbs_11_1 : String := proverbs_11_1
def site_leviticus_25_8 : String := leviticus_25_8
def site_leviticus_25_10 : String := leviticus_25_10
def site_leviticus_25_13 : String := leviticus_25_13

theorem site_genesis_3_24_eq_source : site_genesis_3_24 = genesis_3_24 :=
  rfl

theorem site_exodus_20_1_eq_source : site_exodus_20_1 = exodus_20_1 :=
  rfl

theorem site_exodus_20_2_eq_source : site_exodus_20_2 = exodus_20_2 :=
  rfl

theorem site_exodus_20_3_eq_source : site_exodus_20_3 = exodus_20_3 :=
  rfl

theorem site_exodus_20_4_eq_source : site_exodus_20_4 = exodus_20_4 :=
  rfl

theorem site_exodus_20_5_eq_source : site_exodus_20_5 = exodus_20_5 :=
  rfl

theorem site_exodus_20_6_eq_source : site_exodus_20_6 = exodus_20_6 :=
  rfl

theorem site_exodus_20_7_eq_source : site_exodus_20_7 = exodus_20_7 :=
  rfl

theorem site_exodus_20_8_eq_source : site_exodus_20_8 = exodus_20_8 :=
  rfl

theorem site_exodus_20_9_eq_source : site_exodus_20_9 = exodus_20_9 :=
  rfl

theorem site_exodus_20_10_eq_source : site_exodus_20_10 = exodus_20_10 :=
  rfl

theorem site_exodus_20_11_eq_source : site_exodus_20_11 = exodus_20_11 :=
  rfl

theorem site_exodus_20_12_eq_source : site_exodus_20_12 = exodus_20_12 :=
  rfl

theorem site_exodus_20_13_eq_source : site_exodus_20_13 = exodus_20_13 :=
  rfl

theorem site_exodus_20_14_eq_source : site_exodus_20_14 = exodus_20_14 :=
  rfl

theorem site_exodus_20_15_eq_source : site_exodus_20_15 = exodus_20_15 :=
  rfl

theorem site_exodus_20_16_eq_source : site_exodus_20_16 = exodus_20_16 :=
  rfl

theorem site_exodus_20_17_eq_source : site_exodus_20_17 = exodus_20_17 :=
  rfl

theorem site_matthew_5_3_eq_source : site_matthew_5_3 = matthew_5_3 :=
  rfl

theorem site_matthew_5_4_eq_source : site_matthew_5_4 = matthew_5_4 :=
  rfl

theorem site_matthew_5_5_eq_source : site_matthew_5_5 = matthew_5_5 :=
  rfl

theorem site_matthew_5_6_eq_source : site_matthew_5_6 = matthew_5_6 :=
  rfl

theorem site_matthew_5_7_eq_source : site_matthew_5_7 = matthew_5_7 :=
  rfl

theorem site_matthew_5_8_eq_source : site_matthew_5_8 = matthew_5_8 :=
  rfl

theorem site_matthew_5_9_eq_source : site_matthew_5_9 = matthew_5_9 :=
  rfl

theorem site_matthew_5_10_eq_source : site_matthew_5_10 = matthew_5_10 :=
  rfl

theorem site_matthew_5_11_eq_source : site_matthew_5_11 = matthew_5_11 :=
  rfl

theorem site_matthew_5_12_eq_source : site_matthew_5_12 = matthew_5_12 :=
  rfl

theorem site_matthew_11_29_eq_source : site_matthew_11_29 = matthew_11_29 :=
  rfl

theorem site_philippians_2_3_eq_source : site_philippians_2_3 = philippians_2_3 :=
  rfl

theorem site_leviticus_19_35_eq_source :
    site_leviticus_19_35 = leviticus_19_35 :=
  rfl

theorem site_leviticus_19_36_eq_source :
    site_leviticus_19_36 = leviticus_19_36 :=
  rfl

theorem site_deuteronomy_25_13_eq_source :
    site_deuteronomy_25_13 = deuteronomy_25_13 :=
  rfl

theorem site_deuteronomy_25_14_eq_source :
    site_deuteronomy_25_14 = deuteronomy_25_14 :=
  rfl

theorem site_deuteronomy_25_15_eq_source :
    site_deuteronomy_25_15 = deuteronomy_25_15 :=
  rfl

theorem site_proverbs_11_1_eq_source :
    site_proverbs_11_1 = proverbs_11_1 :=
  rfl

theorem site_leviticus_25_8_eq_source :
    site_leviticus_25_8 = leviticus_25_8 :=
  rfl

theorem site_leviticus_25_10_eq_source :
    site_leviticus_25_10 = leviticus_25_10 :=
  rfl

theorem site_leviticus_25_13_eq_source :
    site_leviticus_25_13 = leviticus_25_13 :=
  rfl

/-- A two-sided inverse. Same shape as mathlib `Equiv`, without mathlib. -/
structure Iso (α β : Type) where
  toFun : α → β
  invFun : β → α
  left_inv : ∀ x, invFun (toFun x) = x
  right_inv : ∀ y, toFun (invFun y) = y

/-- Vocabulary terms we warrant from the quotations used on the site. -/
inductive WarrantedTerm where
  | falseTestimony
  | peaceMakers
  | cherubins
  | humility
  deriving DecidableEq, Repr

/-- Named Douay-Rheims citations those terms are warranted from. -/
inductive NamedQuotation where
  | exodus_20_16
  | matthew_5_9
  | genesis_3_24
  | matthew_11_29
  | philippians_2_3
  deriving DecidableEq, Repr

/-- A warrant is one named verse, or a named verse pair. Not always a bijection. -/
inductive Warrant where
  | oneVerse : NamedQuotation → Warrant
  | versePair : NamedQuotation → NamedQuotation → Warrant
  deriving DecidableEq, Repr

def citation : NamedQuotation → String
  | .exodus_20_16 => "Exodus 20:16"
  | .matthew_5_9 => "Matthew 5:9"
  | .genesis_3_24 => "Genesis 3:24"
  | .matthew_11_29 => "Matthew 11:29"
  | .philippians_2_3 => "Philippians 2:3"

def words : NamedQuotation → String
  | .exodus_20_16 => exodus_20_16
  | .matthew_5_9 => matthew_5_9
  | .genesis_3_24 => genesis_3_24
  | .matthew_11_29 => matthew_11_29
  | .philippians_2_3 => philippians_2_3

theorem words_exodus_20_16 :
    words .exodus_20_16 =
      "Thou shalt not speak against thy neighbour false testimony." :=
  rfl

theorem words_matthew_5_9 :
    words .matthew_5_9 =
      "Blessed are the peace-makers: for they shall be called the children of God." :=
  rfl

theorem words_genesis_3_24 :
    words .genesis_3_24 =
      "And he cast out Adam, and placed before the Paradise of pleasure Cherubins, " ++
        "and a flaming and a turning sword, for to keep the way of the tree of life." :=
  rfl

theorem words_matthew_11_29 :
    words .matthew_11_29 =
      "Take up my yoke upon you, and learn of me, because I am meek, and humble of heart: " ++
        "and you shall find rest to your souls." :=
  rfl

theorem words_philippians_2_3 :
    words .philippians_2_3 =
      "Nothing by contention, neither by vain glory: but in humility, each counting " ++
        "other better than themselves:" :=
  rfl

def warrant : WarrantedTerm → Warrant
  | .falseTestimony => .oneVerse .exodus_20_16
  | .peaceMakers => .oneVerse .matthew_5_9
  | .cherubins => .oneVerse .genesis_3_24
  | .humility => .versePair .matthew_11_29 .philippians_2_3

/-- One-verse fragment: the three terms that each have exactly one citation. -/
inductive OneVerseTerm where
  | falseTestimony
  | peaceMakers
  | cherubins
  deriving DecidableEq, Repr

/-- The three citations that pair with `OneVerseTerm`. Not the humility pair. -/
inductive OneVerseQuotation where
  | exodus_20_16
  | matthew_5_9
  | genesis_3_24
  deriving DecidableEq, Repr

def to_quotation : OneVerseTerm → OneVerseQuotation
  | .falseTestimony => .exodus_20_16
  | .peaceMakers => .matthew_5_9
  | .cherubins => .genesis_3_24

def of_quotation : OneVerseQuotation → OneVerseTerm
  | .exodus_20_16 => .falseTestimony
  | .matthew_5_9 => .peaceMakers
  | .genesis_3_24 => .cherubins

def oneVerseTerm : OneVerseTerm → WarrantedTerm
  | .falseTestimony => .falseTestimony
  | .peaceMakers => .peaceMakers
  | .cherubins => .cherubins

def oneVerseQuotation : OneVerseQuotation → NamedQuotation
  | .exodus_20_16 => .exodus_20_16
  | .matthew_5_9 => .matthew_5_9
  | .genesis_3_24 => .genesis_3_24

/--
  One-verse fragment: each of these three terms is exactly one named
  quotation, and each of those quotations is exactly one of those terms.
  This is not the humility warrant.
-/
def one_verse_term_iso_quotation : Iso OneVerseTerm OneVerseQuotation where
  toFun := to_quotation
  invFun := of_quotation
  left_inv := fun t ↦ by cases t <;> rfl
  right_inv := fun q ↦ by cases q <;> rfl

theorem to_quotation_left_inverse (t : OneVerseTerm) :
    of_quotation (to_quotation t) = t :=
  one_verse_term_iso_quotation.left_inv t

theorem of_quotation_right_inverse (q : OneVerseQuotation) :
    to_quotation (of_quotation q) = q :=
  one_verse_term_iso_quotation.right_inv q

theorem one_verse_term_warrant (t : OneVerseTerm) :
    warrant (oneVerseTerm t) = .oneVerse (oneVerseQuotation (to_quotation t)) :=
  match t with
  | .falseTestimony => rfl
  | .peaceMakers => rfl
  | .cherubins => rfl

theorem false_testimony_is_exodus_20_16 :
    warrant .falseTestimony = .oneVerse .exodus_20_16 ∧
      citation .exodus_20_16 = "Exodus 20:16" ∧
      words .exodus_20_16 = exodus_20_16 :=
  ⟨rfl, rfl, rfl⟩

theorem peace_makers_is_matthew_5_9 :
    warrant .peaceMakers = .oneVerse .matthew_5_9 ∧
      citation .matthew_5_9 = "Matthew 5:9" ∧
      words .matthew_5_9 = matthew_5_9 :=
  ⟨rfl, rfl, rfl⟩

theorem cherubins_is_genesis_3_24 :
    warrant .cherubins = .oneVerse .genesis_3_24 ∧
      citation .genesis_3_24 = "Genesis 3:24" ∧
      words .genesis_3_24 = genesis_3_24 :=
  ⟨rfl, rfl, rfl⟩

theorem humility_is_matthew_11_29_and_philippians_2_3 :
    warrant .humility = .versePair .matthew_11_29 .philippians_2_3 ∧
      citation .matthew_11_29 = "Matthew 11:29" ∧
      citation .philippians_2_3 = "Philippians 2:3" ∧
      words .matthew_11_29 = matthew_11_29 ∧
      words .philippians_2_3 = philippians_2_3 :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

theorem humility_warrant_ne_oneVerse (q : NamedQuotation) :
    warrant .humility ≠ Warrant.oneVerse q :=
  fun h ↦ nomatch h

end DouayRheims
