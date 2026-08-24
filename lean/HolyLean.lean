/-
  Holy Lean: theological and moral vocabulary used to check public site sentences.

  This library does not prove that God exists. Terms are definitions matching
  vocabulary.html, not metaphysical theorems. Copy assertions are structure
  fields, not Lean `axiom`s. There is no `sorry`.
-/

import DouayRheims

namespace HolyLean

/-- Science, on this site, is natural philosophy. -/
structure Science where
  isNaturalPhilosophy : Bool
  deriving Repr

/-- The scientific method: a loop of theory and evidence. -/
structure ScientificMethod where
  theoryAndEvidenceLoop : Bool
  methodologicalReasoningAboutNature : Bool
  deriving Repr

/-- Scripture as named on Faith: Ten Commandments, Beatitudes, Genesis 3. -/
structure Scripture where
  includesTenCommandments : Bool
  includesBeatitudes : Bool
  includesGenesis3 : Bool
  philoIsNotScripture : Bool
  genesis324 : String
  exodus2016 : String
  matthew59 : String
  deriving Repr

/-- Sin: darkness, lacking God's good light, and rejection of reason and truth. -/
structure Sin where
  darknessLackingGodsGoodLight : Bool
  rejectionOfReasonAndTruth : Bool
  sinDefinitionIsSiteDefinitionNotQuotation : Bool
  sinHasNoScriptureIsomorphism : Bool
  deriving Repr

/-- Theism is a strong claim and is not treated as scientifically proven. -/
structure Theism where
  isStrongClaim : Bool
  scientificallyProven : Bool
  deriving Repr

/-- Atheism is a strong claim and is not treated as scientifically proven. -/
structure Atheism where
  isStrongClaim : Bool
  scientificallyProven : Bool
  deriving Repr

/-- Humility: the moral virtue from two verses, not an epistemic verdict. -/
structure Humility where
  meekAndHumbleOfHeart : Bool
  countingOtherBetterThanThemselves : Bool
  matthew1129 : String
  philippians23 : String
  warrant : DouayRheims.Warrant
  deriving Repr

/-- False witness is forbidden. -/
structure FalseWitness where
  forbidden : Bool
  deriving Repr

/-- Ecumenism: shared common values, not the ones used to divide. -/
structure Ecumenism where
  focusOnSharedCommonValues : Bool
  deriving Repr

/-- Bitcoin, as named on Philosophy. -/
structure Bitcoin where
  challengesNationStateMonetarySovereignty : Bool
  voluntaryCheckOnCentralBankerOverreach : Bool
  firstOptionVsHyperinflationViolence : Bool
  isNaturalChoice : Bool
  hasFlaws : Bool
  deriving Repr

/-- Fiat money as named on Philosophy. 1971 is site history, not a Douay quote. -/
structure Fiat where
  dollarAsWeKnowItSince1971 : Bool
  systemsEndAsPredecessorsEnded : Bool
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote : Bool
  deriving Repr

/--
  Biblical jubilee is Leviticus 25, the fiftieth year.
  That law is distinct from the site's 1971 historical reading.
-/
structure Jubilee where
  wantJoyousDebtJubileeNotChaos : Bool
  debtJubileesEveryFiftyYears : Bool
  biblicalJubileeIsLeviticus25FiftiethYear : Bool
  biblicalJubileeIsDistinctFrom1971Reading : Bool
  deriving Repr

/-- Natural law, as named on Philosophy. -/
structure NaturalLaw where
  hardenedMoneyBuiltOnIt : Bool
  appliedMathAndCryptoEmergentFromNature : Bool
  appliedMathAndCryptoExtrajudicial : Bool
  deriving Repr

/-- What this edition is, and what it is not. -/
structure QuotedEdition where
  quotedEditionIsOriginalDouayRheims : Bool
  quotedEditionIsNotKingJames : Bool
  quotedEditionIsNotChalloner : Bool
  sourceCitation : String
  deriving Repr

/-- Numbering and spelling of the printed commandment and Beatitude blocks. -/
structure PrintedFramework where
  verseExplanationsAreOursNotScripture : Bool
  commandmentsAreExodus20Verses1To17 : Bool
  exodus201IsPrintedPreface : Bool
  beatitudesAreMatthew5Verses3To12 : Bool
  meekNumberedAtMatthew54Not55 : Bool
  printedSpellingCherubinsNotCherubim : Bool
  printedSpellingPeaceMakersHyphen : Bool
  genesis324DoesNotSayGardenOfEden : Bool
  deriving Repr

/-- Karibu is a later gloss. It is not in this Douay-Rheims edition. -/
structure KaribuNote where
  karibuNotInThisDouayEdition : Bool
  karibuIsHistoricalGlossNotQuote : Bool
  karibuEtymologyDebatedNotProven : Bool
  deriving Repr

/-- Theory and Evidence is this site's picture of Genesis 3:24, not a quote. -/
structure TheoryAndEvidencePicture where
  theoryAndEvidencePictureIsSites : Bool
  theoryAndEvidencePictureIsNotPhiloWording : Bool
  theoryAndEvidencePictureIsNotDouayQuote : Bool
  genesis324ReadAsPictureNotLaboratoryResult : Bool
  cherubimKaribuPhiloAreNotDouayQuotes : Bool
  notClaimingCherubinsAreLamassu : Bool
  notClaimingGenesisIsEnumaElish : Bool
  deriving Repr

/-- This library encodes copy. It does not prove God, endure-in-the-world, or science=scripture. -/
structure LeanScope where
  leanIsoIsNotScienceScriptureIso : Bool
  leanDoesNotProveGodExists : Bool
  leanDoesNotProveWeWillEndure : Bool
  leanDoesNotProveBitcoinWillWin : Bool
  deriving Repr

/-- Grok OSS is a harness. It is not yet an operating system. -/
structure GrokOss where
  isNotYetOperatingSystem : Bool
  helpsBootstrapFutureOs : Bool
  deriving Repr

/-- Post-quantum cryptography is not quantum computing. -/
structure PostQuantumCryptography where
  isClassicalCryptographyMeantToResistQuantumComputers : Bool
  isNotQuantumComputing : Bool
  bip360IsProposedPqcNotAQuantumComputer : Bool
  libbitcoinpqcIsNotAQuantumComputer : Bool
  deriving Repr

/-- Quantum computing is a machine class, not a PQC library. -/
structure QuantumComputing where
  isAMachineClass : Bool
  isNotPostQuantumCryptography : Bool
  deriving Repr

/-- Provably perfect: best we can, despite everything. Not metaphysical perfection. -/
structure ProvablyPerfect where
  meansBestWeCanDespiteEverything : Bool
  isNotMetaphysicalPerfection : Bool
  deriving Repr

/-- Printed company philosophy: protect people and what they value; endure where others fail. -/
structure EndurePhilosophy where
  protectContributorsFriendsAndLovedOnes : Bool
  protectAgainstThreatsToThingsTheyValue : Bool
  endureWhereOthersFailIfProtected : Bool
  deriving Repr

/-- Honest weights and measures, a Christian principle named on Philosophy. -/
structure HonestWeightsAndMeasures where
  isChristianPrinciple : Bool
  deriving Repr

/-- Stance on whether the scientific method contradicts scripture. -/
structure MethodAndScripture where
  consideredContradictory : Bool
  contradictionProved : Bool
  deriving Repr

/-- Public vocabulary as used on the site. These values are asserted, not proven. -/
structure Vocabulary where
  science : Science
  scientificMethod : ScientificMethod
  scripture : Scripture
  sin : Sin
  theism : Theism
  atheism : Atheism
  humility : Humility
  falseWitness : FalseWitness
  ecumenism : Ecumenism
  bitcoin : Bitcoin
  fiat : Fiat
  jubilee : Jubilee
  naturalLaw : NaturalLaw
  honestWeights : HonestWeightsAndMeasures
  methodAndScripture : MethodAndScripture
  quotedEdition : QuotedEdition
  printedFramework : PrintedFramework
  karibu : KaribuNote
  theoryAndEvidencePicture : TheoryAndEvidencePicture
  leanScope : LeanScope
  grokOss : GrokOss
  postQuantumCryptography : PostQuantumCryptography
  quantumComputing : QuantumComputing
  provablyPerfect : ProvablyPerfect
  endure : EndurePhilosophy
  deriving Repr

/-- The live public vocabulary, as a model. These values are asserted, not proven. -/
def assertedVocabulary : Vocabulary where
  science := { isNaturalPhilosophy := true }
  scientificMethod := {
    theoryAndEvidenceLoop := true
    methodologicalReasoningAboutNature := true
  }
  scripture := {
    includesTenCommandments := true
    includesBeatitudes := true
    includesGenesis3 := true
    philoIsNotScripture := true
    genesis324 := DouayRheims.site_genesis_3_24
    exodus2016 := DouayRheims.site_exodus_20_16
    matthew59 := DouayRheims.site_matthew_5_9
  }
  sin := {
    darknessLackingGodsGoodLight := true
    rejectionOfReasonAndTruth := true
    sinDefinitionIsSiteDefinitionNotQuotation := true
    sinHasNoScriptureIsomorphism := true
  }
  theism := { isStrongClaim := true, scientificallyProven := false }
  atheism := { isStrongClaim := true, scientificallyProven := false }
  humility := {
    meekAndHumbleOfHeart := true
    countingOtherBetterThanThemselves := true
    matthew1129 := DouayRheims.site_matthew_11_29
    philippians23 := DouayRheims.site_philippians_2_3
    warrant := DouayRheims.warrant .humility
  }
  falseWitness := { forbidden := true }
  ecumenism := { focusOnSharedCommonValues := true }
  bitcoin := {
    challengesNationStateMonetarySovereignty := true
    voluntaryCheckOnCentralBankerOverreach := true
    firstOptionVsHyperinflationViolence := true
    isNaturalChoice := true
    hasFlaws := true
  }
  fiat := {
    dollarAsWeKnowItSince1971 := true
    systemsEndAsPredecessorsEnded := true
    nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote := true
  }
  jubilee := {
    wantJoyousDebtJubileeNotChaos := true
    debtJubileesEveryFiftyYears := true
    biblicalJubileeIsLeviticus25FiftiethYear := true
    biblicalJubileeIsDistinctFrom1971Reading := true
  }
  naturalLaw := {
    hardenedMoneyBuiltOnIt := true
    appliedMathAndCryptoEmergentFromNature := true
    appliedMathAndCryptoExtrajudicial := true
  }
  honestWeights := { isChristianPrinciple := true }
  methodAndScripture := {
    consideredContradictory := false
    contradictionProved := false
  }
  quotedEdition := {
    quotedEditionIsOriginalDouayRheims := true
    quotedEditionIsNotKingJames := true
    quotedEditionIsNotChalloner := true
    sourceCitation := DouayRheims.source_citation
  }
  printedFramework := {
    verseExplanationsAreOursNotScripture := true
    commandmentsAreExodus20Verses1To17 := true
    exodus201IsPrintedPreface := true
    beatitudesAreMatthew5Verses3To12 := true
    meekNumberedAtMatthew54Not55 := true
    printedSpellingCherubinsNotCherubim := true
    printedSpellingPeaceMakersHyphen := true
    genesis324DoesNotSayGardenOfEden := true
  }
  karibu := {
    karibuNotInThisDouayEdition := true
    karibuIsHistoricalGlossNotQuote := true
    karibuEtymologyDebatedNotProven := true
  }
  theoryAndEvidencePicture := {
    theoryAndEvidencePictureIsSites := true
    theoryAndEvidencePictureIsNotPhiloWording := true
    theoryAndEvidencePictureIsNotDouayQuote := true
    genesis324ReadAsPictureNotLaboratoryResult := true
    cherubimKaribuPhiloAreNotDouayQuotes := true
    notClaimingCherubinsAreLamassu := true
    notClaimingGenesisIsEnumaElish := true
  }
  leanScope := {
    leanIsoIsNotScienceScriptureIso := true
    leanDoesNotProveGodExists := true
    leanDoesNotProveWeWillEndure := true
    leanDoesNotProveBitcoinWillWin := true
  }
  grokOss := {
    isNotYetOperatingSystem := true
    helpsBootstrapFutureOs := true
  }
  postQuantumCryptography := {
    isClassicalCryptographyMeantToResistQuantumComputers := true
    isNotQuantumComputing := true
    bip360IsProposedPqcNotAQuantumComputer := true
    libbitcoinpqcIsNotAQuantumComputer := true
  }
  quantumComputing := {
    isAMachineClass := true
    isNotPostQuantumCryptography := true
  }
  provablyPerfect := {
    meansBestWeCanDespiteEverything := true
    isNotMetaphysicalPerfection := true
  }
  endure := {
    protectContributorsFriendsAndLovedOnes := true
    protectAgainstThreatsToThingsTheyValue := true
    endureWhereOthersFailIfProtected := true
  }

/-- Well-formed vocabulary: site definitions, with no P ∧ ¬P. -/
structure WellFormed (v : Vocabulary) : Prop where
  scienceIsNaturalPhilosophy : v.science.isNaturalPhilosophy = true
  methodIsLoop : v.scientificMethod.theoryAndEvidenceLoop = true
  methodReasonsAboutNature : v.scientificMethod.methodologicalReasoningAboutNature = true
  scriptureHasTenCommandments : v.scripture.includesTenCommandments = true
  scriptureHasBeatitudes : v.scripture.includesBeatitudes = true
  scriptureHasGenesis3 : v.scripture.includesGenesis3 = true
  philoIsNotScripture : v.scripture.philoIsNotScripture = true
  genesis324IsDr : v.scripture.genesis324 = DouayRheims.genesis_3_24
  exodus2016IsDr : v.scripture.exodus2016 = DouayRheims.exodus_20_16
  matthew59IsDr : v.scripture.matthew59 = DouayRheims.matthew_5_9
  sinIsDarkness : v.sin.darknessLackingGodsGoodLight = true
  sinRejectsReason : v.sin.rejectionOfReasonAndTruth = true
  sinDefinitionIsSiteDefinitionNotQuotation :
    v.sin.sinDefinitionIsSiteDefinitionNotQuotation = true
  sinHasNoScriptureIsomorphism : v.sin.sinHasNoScriptureIsomorphism = true
  theismIsStrong : v.theism.isStrongClaim = true
  theismNotScientificallyProven : v.theism.scientificallyProven = false
  atheismIsStrong : v.atheism.isStrongClaim = true
  atheismNotScientificallyProven : v.atheism.scientificallyProven = false
  humilityMeekOfHeart : v.humility.meekAndHumbleOfHeart = true
  humilityCountsOtherBetter : v.humility.countingOtherBetterThanThemselves = true
  matthew1129IsDr : v.humility.matthew1129 = DouayRheims.matthew_11_29
  philippians23IsDr : v.humility.philippians23 = DouayRheims.philippians_2_3
  humilityWarrantIsVersePair :
    v.humility.warrant =
      DouayRheims.Warrant.versePair .matthew_11_29 .philippians_2_3
  falseWitnessForbidden : v.falseWitness.forbidden = true
  ecumenismSharedValues : v.ecumenism.focusOnSharedCommonValues = true
  bitcoinChallengesNationStateMonetarySovereignty :
    v.bitcoin.challengesNationStateMonetarySovereignty = true
  bitcoinVoluntaryCheckOnCentralBankerOverreach :
    v.bitcoin.voluntaryCheckOnCentralBankerOverreach = true
  bitcoinFirstOptionVsHyperinflationViolence :
    v.bitcoin.firstOptionVsHyperinflationViolence = true
  bitcoinIsNaturalChoice : v.bitcoin.isNaturalChoice = true
  bitcoinHasFlaws : v.bitcoin.hasFlaws = true
  dollarAsWeKnowItSince1971 : v.fiat.dollarAsWeKnowItSince1971 = true
  fiatSystemsEndAsPredecessorsEnded : v.fiat.systemsEndAsPredecessorsEnded = true
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote :
    v.fiat.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote = true
  wantJoyousDebtJubileeNotChaos : v.jubilee.wantJoyousDebtJubileeNotChaos = true
  debtJubileesEveryFiftyYears : v.jubilee.debtJubileesEveryFiftyYears = true
  biblicalJubileeIsLeviticus25FiftiethYear :
    v.jubilee.biblicalJubileeIsLeviticus25FiftiethYear = true
  biblicalJubileeIsDistinctFrom1971Reading :
    v.jubilee.biblicalJubileeIsDistinctFrom1971Reading = true
  naturalLawMoney : v.naturalLaw.hardenedMoneyBuiltOnIt = true
  appliedMathAndCryptoEmergentFromNature :
    v.naturalLaw.appliedMathAndCryptoEmergentFromNature = true
  appliedMathAndCryptoExtrajudicial :
    v.naturalLaw.appliedMathAndCryptoExtrajudicial = true
  honestWeightsChristian : v.honestWeights.isChristianPrinciple = true
  methodNotConsideredContradictory : v.methodAndScripture.consideredContradictory = false
  noProvedContradiction : v.methodAndScripture.contradictionProved = false
  quotedEditionIsOriginalDouayRheims :
    v.quotedEdition.quotedEditionIsOriginalDouayRheims = true
  quotedEditionIsNotKingJames : v.quotedEdition.quotedEditionIsNotKingJames = true
  quotedEditionIsNotChalloner : v.quotedEdition.quotedEditionIsNotChalloner = true
  sourceCitationEqDouayRheims :
    v.quotedEdition.sourceCitation = DouayRheims.source_citation
  verseExplanationsAreOursNotScripture :
    v.printedFramework.verseExplanationsAreOursNotScripture = true
  commandmentsAreExodus20Verses1To17 :
    v.printedFramework.commandmentsAreExodus20Verses1To17 = true
  exodus201IsPrintedPreface : v.printedFramework.exodus201IsPrintedPreface = true
  beatitudesAreMatthew5Verses3To12 :
    v.printedFramework.beatitudesAreMatthew5Verses3To12 = true
  meekNumberedAtMatthew54Not55 :
    v.printedFramework.meekNumberedAtMatthew54Not55 = true
  printedSpellingCherubinsNotCherubim :
    v.printedFramework.printedSpellingCherubinsNotCherubim = true
  printedSpellingPeaceMakersHyphen :
    v.printedFramework.printedSpellingPeaceMakersHyphen = true
  genesis324DoesNotSayGardenOfEden :
    v.printedFramework.genesis324DoesNotSayGardenOfEden = true
  karibuNotInThisDouayEdition : v.karibu.karibuNotInThisDouayEdition = true
  karibuIsHistoricalGlossNotQuote : v.karibu.karibuIsHistoricalGlossNotQuote = true
  karibuEtymologyDebatedNotProven : v.karibu.karibuEtymologyDebatedNotProven = true
  theoryAndEvidencePictureIsSites :
    v.theoryAndEvidencePicture.theoryAndEvidencePictureIsSites = true
  theoryAndEvidencePictureIsNotPhiloWording :
    v.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotPhiloWording = true
  theoryAndEvidencePictureIsNotDouayQuote :
    v.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotDouayQuote = true
  genesis324ReadAsPictureNotLaboratoryResult :
    v.theoryAndEvidencePicture.genesis324ReadAsPictureNotLaboratoryResult = true
  cherubimKaribuPhiloAreNotDouayQuotes :
    v.theoryAndEvidencePicture.cherubimKaribuPhiloAreNotDouayQuotes = true
  notClaimingCherubinsAreLamassu :
    v.theoryAndEvidencePicture.notClaimingCherubinsAreLamassu = true
  notClaimingGenesisIsEnumaElish :
    v.theoryAndEvidencePicture.notClaimingGenesisIsEnumaElish = true
  leanIsoIsNotScienceScriptureIso :
    v.leanScope.leanIsoIsNotScienceScriptureIso = true
  leanDoesNotProveGodExists : v.leanScope.leanDoesNotProveGodExists = true
  leanDoesNotProveWeWillEndure : v.leanScope.leanDoesNotProveWeWillEndure = true
  leanDoesNotProveBitcoinWillWin : v.leanScope.leanDoesNotProveBitcoinWillWin = true
  grokOssIsNotYetOperatingSystem : v.grokOss.isNotYetOperatingSystem = true
  grokOssHelpsBootstrapFutureOs : v.grokOss.helpsBootstrapFutureOs = true
  pqcIsClassicalCryptoMeantToResistQuantumComputers :
    v.postQuantumCryptography.isClassicalCryptographyMeantToResistQuantumComputers =
      true
  pqcIsNotQuantumComputing :
    v.postQuantumCryptography.isNotQuantumComputing = true
  bip360IsProposedPqcNotAQuantumComputer :
    v.postQuantumCryptography.bip360IsProposedPqcNotAQuantumComputer = true
  libbitcoinpqcIsNotAQuantumComputer :
    v.postQuantumCryptography.libbitcoinpqcIsNotAQuantumComputer = true
  quantumComputingIsAMachineClass : v.quantumComputing.isAMachineClass = true
  quantumComputingIsNotPqc :
    v.quantumComputing.isNotPostQuantumCryptography = true
  provablyPerfectMeansBestWeCan :
    v.provablyPerfect.meansBestWeCanDespiteEverything = true
  provablyPerfectIsNotMetaphysicalPerfection :
    v.provablyPerfect.isNotMetaphysicalPerfection = true
  protectContributorsFriendsAndLovedOnes :
    v.endure.protectContributorsFriendsAndLovedOnes = true
  protectAgainstThreatsToThingsTheyValue :
    v.endure.protectAgainstThreatsToThingsTheyValue = true
  endureWhereOthersFailIfProtected :
    v.endure.endureWhereOthersFailIfProtected = true

theorem asserted_vocabulary_well_formed : WellFormed assertedVocabulary where
  scienceIsNaturalPhilosophy := rfl
  methodIsLoop := rfl
  methodReasonsAboutNature := rfl
  scriptureHasTenCommandments := rfl
  scriptureHasBeatitudes := rfl
  scriptureHasGenesis3 := rfl
  philoIsNotScripture := rfl
  genesis324IsDr := rfl
  exodus2016IsDr := rfl
  matthew59IsDr := rfl
  sinIsDarkness := rfl
  sinRejectsReason := rfl
  sinDefinitionIsSiteDefinitionNotQuotation := rfl
  sinHasNoScriptureIsomorphism := rfl
  theismIsStrong := rfl
  theismNotScientificallyProven := rfl
  atheismIsStrong := rfl
  atheismNotScientificallyProven := rfl
  humilityMeekOfHeart := rfl
  humilityCountsOtherBetter := rfl
  matthew1129IsDr := rfl
  philippians23IsDr := rfl
  humilityWarrantIsVersePair := rfl
  falseWitnessForbidden := rfl
  ecumenismSharedValues := rfl
  bitcoinChallengesNationStateMonetarySovereignty := rfl
  bitcoinVoluntaryCheckOnCentralBankerOverreach := rfl
  bitcoinFirstOptionVsHyperinflationViolence := rfl
  bitcoinIsNaturalChoice := rfl
  bitcoinHasFlaws := rfl
  dollarAsWeKnowItSince1971 := rfl
  fiatSystemsEndAsPredecessorsEnded := rfl
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote := rfl
  wantJoyousDebtJubileeNotChaos := rfl
  debtJubileesEveryFiftyYears := rfl
  biblicalJubileeIsLeviticus25FiftiethYear := rfl
  biblicalJubileeIsDistinctFrom1971Reading := rfl
  naturalLawMoney := rfl
  appliedMathAndCryptoEmergentFromNature := rfl
  appliedMathAndCryptoExtrajudicial := rfl
  honestWeightsChristian := rfl
  methodNotConsideredContradictory := rfl
  noProvedContradiction := rfl
  quotedEditionIsOriginalDouayRheims := rfl
  quotedEditionIsNotKingJames := rfl
  quotedEditionIsNotChalloner := rfl
  sourceCitationEqDouayRheims := rfl
  verseExplanationsAreOursNotScripture := rfl
  commandmentsAreExodus20Verses1To17 := rfl
  exodus201IsPrintedPreface := rfl
  beatitudesAreMatthew5Verses3To12 := rfl
  meekNumberedAtMatthew54Not55 := rfl
  printedSpellingCherubinsNotCherubim := rfl
  printedSpellingPeaceMakersHyphen := rfl
  genesis324DoesNotSayGardenOfEden := rfl
  karibuNotInThisDouayEdition := rfl
  karibuIsHistoricalGlossNotQuote := rfl
  karibuEtymologyDebatedNotProven := rfl
  theoryAndEvidencePictureIsSites := rfl
  theoryAndEvidencePictureIsNotPhiloWording := rfl
  theoryAndEvidencePictureIsNotDouayQuote := rfl
  genesis324ReadAsPictureNotLaboratoryResult := rfl
  cherubimKaribuPhiloAreNotDouayQuotes := rfl
  notClaimingCherubinsAreLamassu := rfl
  notClaimingGenesisIsEnumaElish := rfl
  leanIsoIsNotScienceScriptureIso := rfl
  leanDoesNotProveGodExists := rfl
  leanDoesNotProveWeWillEndure := rfl
  leanDoesNotProveBitcoinWillWin := rfl
  grokOssIsNotYetOperatingSystem := rfl
  grokOssHelpsBootstrapFutureOs := rfl
  pqcIsClassicalCryptoMeantToResistQuantumComputers := rfl
  pqcIsNotQuantumComputing := rfl
  bip360IsProposedPqcNotAQuantumComputer := rfl
  libbitcoinpqcIsNotAQuantumComputer := rfl
  quantumComputingIsAMachineClass := rfl
  quantumComputingIsNotPqc := rfl
  provablyPerfectMeansBestWeCan := rfl
  provablyPerfectIsNotMetaphysicalPerfection := rfl
  protectContributorsFriendsAndLovedOnes := rfl
  protectAgainstThreatsToThingsTheyValue := rfl
  endureWhereOthersFailIfProtected := rfl

/-- Neither theism nor atheism is scientifically proven. -/
theorem neither_theism_nor_atheism_scientifically_proven
    (v : Vocabulary) (h : WellFormed v) :
    v.theism.scientificallyProven = false ∧ v.atheism.scientificallyProven = false :=
  ⟨h.theismNotScientificallyProven, h.atheismNotScientificallyProven⟩

/-- Scientific method is not treated as contradicting scripture unless a contradiction is proven. -/
theorem scientific_method_does_not_contradict_scripture_unless_proved
    (v : Vocabulary) (h : WellFormed v) :
    v.methodAndScripture.consideredContradictory = false ∧
      v.methodAndScripture.contradictionProved = false :=
  ⟨h.methodNotConsideredContradictory, h.noProvedContradiction⟩

/-- If a contradiction with scripture is not proven, we do not treat the method as contradictory. -/
theorem unproved_contradiction_is_not_treated_as_contradiction
    (v : Vocabulary) (h : WellFormed v)
    (_unproved : v.methodAndScripture.contradictionProved = false) :
    v.methodAndScripture.consideredContradictory = false :=
  h.methodNotConsideredContradictory

theorem science_is_natural_philosophy (v : Vocabulary) (h : WellFormed v) :
    v.science.isNaturalPhilosophy = true :=
  h.scienceIsNaturalPhilosophy

theorem vocabulary_inhabited : Nonempty { v : Vocabulary // WellFormed v } :=
  ⟨⟨assertedVocabulary, asserted_vocabulary_well_formed⟩⟩

/-- Public vocabulary quotations are the Douay-Rheims source strings. -/
theorem asserted_quotations_eq_douay_rheims :
    assertedVocabulary.scripture.genesis324 = DouayRheims.genesis_3_24 ∧
      assertedVocabulary.scripture.exodus2016 = DouayRheims.exodus_20_16 ∧
      assertedVocabulary.scripture.matthew59 = DouayRheims.matthew_5_9 ∧
      assertedVocabulary.humility.matthew1129 = DouayRheims.matthew_11_29 ∧
      assertedVocabulary.humility.philippians23 = DouayRheims.philippians_2_3 :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- Humility is the two-verse warrant, not a fourth one-verse pairing. -/
theorem asserted_humility_warrant :
    assertedVocabulary.humility.warrant = DouayRheims.warrant .humility ∧
      assertedVocabulary.humility.warrant =
        DouayRheims.Warrant.versePair .matthew_11_29 .philippians_2_3 :=
  ⟨rfl, rfl⟩

theorem humility_warrant_ne_oneVerse (v : Vocabulary) (h : WellFormed v)
    (q : DouayRheims.NamedQuotation) :
    v.humility.warrant ≠ DouayRheims.Warrant.oneVerse q :=
  fun eq ↦ nomatch h.humilityWarrantIsVersePair.symm.trans eq

theorem karibu_not_in_this_douay_edition (v : Vocabulary) (h : WellFormed v) :
    v.karibu.karibuNotInThisDouayEdition = true :=
  h.karibuNotInThisDouayEdition

theorem theory_and_evidence_picture_is_not_philo
    (v : Vocabulary) (h : WellFormed v) :
    v.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotPhiloWording =
      true :=
  h.theoryAndEvidencePictureIsNotPhiloWording

theorem theory_and_evidence_picture_is_not_a_douay_quote
    (v : Vocabulary) (h : WellFormed v) :
    v.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotDouayQuote = true :=
  h.theoryAndEvidencePictureIsNotDouayQuote

theorem philo_is_not_scripture (v : Vocabulary) (h : WellFormed v) :
    v.scripture.philoIsNotScripture = true :=
  h.philoIsNotScripture

/-- Copy Bool: this library does not prove that God exists. -/
theorem lean_does_not_prove_god_exists (v : Vocabulary) (h : WellFormed v) :
    v.leanScope.leanDoesNotProveGodExists = true :=
  h.leanDoesNotProveGodExists

/-- Copy Bool: this library does not prove that Surmount will endure in the world. -/
theorem lean_does_not_prove_we_will_endure (v : Vocabulary) (h : WellFormed v) :
    v.leanScope.leanDoesNotProveWeWillEndure = true :=
  h.leanDoesNotProveWeWillEndure

theorem grok_oss_is_not_yet_an_operating_system
    (v : Vocabulary) (h : WellFormed v) :
    v.grokOss.isNotYetOperatingSystem = true :=
  h.grokOssIsNotYetOperatingSystem

/-- Printed copy: PQC is not quantum computing. -/
theorem pqc_is_not_quantum_computing
    (v : Vocabulary) (h : WellFormed v) :
    v.postQuantumCryptography.isNotQuantumComputing = true ∧
      v.quantumComputing.isNotPostQuantumCryptography = true ∧
      v.postQuantumCryptography.bip360IsProposedPqcNotAQuantumComputer = true ∧
      v.postQuantumCryptography.libbitcoinpqcIsNotAQuantumComputer = true :=
  ⟨h.pqcIsNotQuantumComputing, h.quantumComputingIsNotPqc,
    h.bip360IsProposedPqcNotAQuantumComputer,
    h.libbitcoinpqcIsNotAQuantumComputer⟩

theorem quoted_edition_is_douay_not_kjv_not_challoner
    (v : Vocabulary) (h : WellFormed v) :
    v.quotedEdition.quotedEditionIsOriginalDouayRheims = true ∧
      v.quotedEdition.quotedEditionIsNotKingJames = true ∧
      v.quotedEdition.quotedEditionIsNotChalloner = true :=
  ⟨h.quotedEditionIsOriginalDouayRheims, h.quotedEditionIsNotKingJames,
    h.quotedEditionIsNotChalloner⟩

end HolyLean
