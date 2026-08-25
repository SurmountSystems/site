/-
  Encoded public copy of surmount.systems after the 2026-08-19 honesty edits.

  This library does not prove God, Bitcoin, a product result, or that
  Surmount will endure in the world. It proves that the encoded claims do
  not contradict (no `P ∧ ¬P`). Grok OSS is not encoded as an operating system.

  Fields of `assertedCopy` are the public-copy assertions (treated as axioms of
  the page, not as metaphysical theorems). Named `theorem`s below are the
  consistency facts: humility is not proven theism, neither stance is proven,
  reboot-after-update is a design aim, BIP 360 is proposed, and a model exists.

  Extra axioms besides Lean's standard set (`propext`, `Classical.choice`,
  `Quot.sound`) are only those copy assertions. There is no `sorry`.

  Vocabulary for those sentences lives in HolyLean (imported below).
-/

import DouayRheims
import HolyLean

namespace SiteConsistency

/-- Intellectually honest stance on the creator/judgment question named on Faith. -/
inductive HonestStance where
  | theism
  | atheism
  | humility
  deriving DecidableEq, Repr

/-- Encoded public claims. Boolean and stance fields are copy assertions. -/
structure SiteCopy where
  foundedOnChristianPrinciples : Bool
  includesHonestWeights : Bool
  workTowardHardenedMoneyOnNaturalLaw : Bool
  voluntarySystemFitting : Bool
  bitcoinHasFlaws : Bool
  openFaithFromHumility : Bool
  theismIsStrongClaim : Bool
  atheismIsStrongClaim : Bool
  provedTheism : Bool
  provedAtheism : Bool
  honestPositionOnCreator : HonestStance
  theismIsOnlyHonestPosition : Bool
  noCollectivePunishment : Bool
  ecumenism : Bool
  noFalseWitness : Bool
  noFaithDiscrimination : Bool
  expectIntellectualHonesty : Bool
  truthseeking : Bool
  rebootAfterUpdateIsDesignAim : Bool
  rebootAfterUpdateProved : Bool
  bip360Proposed : Bool
  bip360DeployedAsFact : Bool
  neitherScientificallyProven : Bool
  scientificMethodNotContradictoryUnlessProved : Bool
  contradictionWithScriptureProved : Bool
  genesis324Quotation : String
  exodus2016Quotation : String
  matthew59Quotation : String
  matthew1129Quotation : String
  philippians23Quotation : String
  humilityWarrant : DouayRheims.Warrant
  karibuNotInThisDouayEdition : Bool
  karibuIsHistoricalGlossNotQuote : Bool
  karibuEtymologyDebatedNotProven : Bool
  theoryAndEvidencePictureIsSites : Bool
  theoryAndEvidencePictureIsNotPhiloWording : Bool
  theoryAndEvidencePictureIsNotDouayQuote : Bool
  genesis324ReadAsPictureNotLaboratoryResult : Bool
  philoIsNotScripture : Bool
  cherubimKaribuPhiloAreNotDouayQuotes : Bool
  quotedEditionIsOriginalDouayRheims : Bool
  quotedEditionIsNotKingJames : Bool
  quotedEditionIsNotChalloner : Bool
  sourceCitation : String
  verseExplanationsAreOursNotScripture : Bool
  genesis324DoesNotSayGardenOfEden : Bool
  printedSpellingCherubinsNotCherubim : Bool
  printedSpellingPeaceMakersHyphen : Bool
  notClaimingCherubinsAreLamassu : Bool
  notClaimingGenesisIsEnumaElish : Bool
  commandmentsAreExodus20Verses1To17 : Bool
  exodus201IsPrintedPreface : Bool
  beatitudesAreMatthew5Verses3To12 : Bool
  meekNumberedAtMatthew54Not55 : Bool
  sinDefinitionIsSiteDefinitionNotQuotation : Bool
  sinHasNoScriptureIsomorphism : Bool
  leanIsoIsNotScienceScriptureIso : Bool
  leanDoesNotProveGodExists : Bool
  noDenominationRequirement : Bool
  doNotTestPersonalFaith : Bool
  secularPathWelcome : Bool
  callPeopleInNotOutInBadFaith : Bool
  russellsTeapotIsAboutMethodNotProofOfGod : Bool
  foundationIs501c3 : Bool
  originalWorkPublicDomainUnlicense : Bool
  bitcoinIsPeerToPeerElectronicCash : Bool
  bitcoinChallengesNationStateMonetarySovereignty : Bool
  bitcoinVoluntaryCheckOnCentralBankerOverreach : Bool
  bitcoinFirstOptionVsHyperinflationViolence : Bool
  wantJoyousDebtJubileeNotChaos : Bool
  debtJubileesEveryFiftyYears : Bool
  naturalLawIsUniversalPrinciplesDiscernibleByReason : Bool
  appliedMathAndCryptoEmergentFromNature : Bool
  appliedMathAndCryptoExtrajudicial : Bool
  bitcoinIsNaturalChoice : Bool
  fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity : Bool
  dollarAsWeKnowItSince1971 : Bool
  fiatSystemsEndAsPredecessorsEnded : Bool
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote : Bool
  biblicalJubileeIsLeviticus25FiftiethYear : Bool
  biblicalJubileeIsDistinctFrom1971Reading : Bool
  harnessIsAlsoOperatingSystem : Bool
  osKernelRunsAtHighestPrivilege : Bool
  osOnX86IsRing0 : Bool
  osOwnsHardwareMemoryProcessesAndIo : Bool
  osUserspaceHarnessIsNotThat : Bool
  grokOssIsHarness : Bool
  grokOssIsNotYetOperatingSystem : Bool
  grokOssHelpsBootstrapFutureOs : Bool
  futureOsProvablyPerfectBestWeCan : Bool
  provablyPerfectIsNotMetaphysicalPerfection : Bool
  futureOsAbsurdlyParanoidAndHardened : Bool
  futureOsStillComputationallyEfficient : Bool
  protectContributorsFriendsAndLovedOnes : Bool
  protectAgainstThreatsToThingsTheyValue : Bool
  endureWhereOthersFailIfProtected : Bool
  leanDoesNotProveWeWillEndure : Bool
  leanDoesNotProveBitcoinWillWin : Bool
  aimUnifyBrowserAndOs : Bool
  unifyBrowserAndOsProved : Bool
  grokOssIsOpenSourceForkAcceptingPrs : Bool
  pqcIsNotQuantumComputing : Bool
  bip360IsNotAQuantumComputer : Bool
  libbitcoinpqcIsNotAQuantumComputer : Bool
  pqcIsNotOpticalCompute : Bool
  pqcIsNotNeuromorphicInMemoryCompute : Bool
  quantumComputingUsesQubitsAndQuantumMechanics : Bool
  opticalComputeUsesPhotonsNotElectrons : Bool
  neuromorphicStoresAndComputesInSameHardware : Bool
  advancedComputeIsResearchAimNotShipped : Bool
  contributorsPageInvitesPastAndFutureContact : Bool
  deriving Repr

/-- The live public copy, as a model. These values are asserted, not proven. -/
def assertedCopy : SiteCopy where
  foundedOnChristianPrinciples := true
  includesHonestWeights := true
  workTowardHardenedMoneyOnNaturalLaw := true
  voluntarySystemFitting := true
  bitcoinHasFlaws := true
  openFaithFromHumility := true
  theismIsStrongClaim := true
  atheismIsStrongClaim := true
  provedTheism := false
  provedAtheism := false
  honestPositionOnCreator := .humility
  theismIsOnlyHonestPosition := false
  noCollectivePunishment := true
  ecumenism := true
  noFalseWitness := true
  noFaithDiscrimination := true
  expectIntellectualHonesty := true
  truthseeking := true
  rebootAfterUpdateIsDesignAim := true
  rebootAfterUpdateProved := false
  bip360Proposed := true
  bip360DeployedAsFact := false
  neitherScientificallyProven := true
  scientificMethodNotContradictoryUnlessProved := true
  contradictionWithScriptureProved := false
  genesis324Quotation := DouayRheims.site_genesis_3_24
  exodus2016Quotation := DouayRheims.site_exodus_20_16
  matthew59Quotation := DouayRheims.site_matthew_5_9
  matthew1129Quotation := DouayRheims.site_matthew_11_29
  philippians23Quotation := DouayRheims.site_philippians_2_3
  humilityWarrant := DouayRheims.warrant .humility
  karibuNotInThisDouayEdition := true
  karibuIsHistoricalGlossNotQuote := true
  karibuEtymologyDebatedNotProven := true
  theoryAndEvidencePictureIsSites := true
  theoryAndEvidencePictureIsNotPhiloWording := true
  theoryAndEvidencePictureIsNotDouayQuote := true
  genesis324ReadAsPictureNotLaboratoryResult := true
  philoIsNotScripture := true
  cherubimKaribuPhiloAreNotDouayQuotes := true
  quotedEditionIsOriginalDouayRheims := true
  quotedEditionIsNotKingJames := true
  quotedEditionIsNotChalloner := true
  sourceCitation := DouayRheims.source_citation
  verseExplanationsAreOursNotScripture := true
  genesis324DoesNotSayGardenOfEden := true
  printedSpellingCherubinsNotCherubim := true
  printedSpellingPeaceMakersHyphen := true
  notClaimingCherubinsAreLamassu := true
  notClaimingGenesisIsEnumaElish := true
  commandmentsAreExodus20Verses1To17 := true
  exodus201IsPrintedPreface := true
  beatitudesAreMatthew5Verses3To12 := true
  meekNumberedAtMatthew54Not55 := true
  sinDefinitionIsSiteDefinitionNotQuotation := true
  sinHasNoScriptureIsomorphism := true
  leanIsoIsNotScienceScriptureIso := true
  leanDoesNotProveGodExists := true
  noDenominationRequirement := true
  doNotTestPersonalFaith := true
  secularPathWelcome := true
  callPeopleInNotOutInBadFaith := true
  russellsTeapotIsAboutMethodNotProofOfGod := true
  foundationIs501c3 := true
  originalWorkPublicDomainUnlicense := true
  bitcoinIsPeerToPeerElectronicCash := true
  bitcoinChallengesNationStateMonetarySovereignty := true
  bitcoinVoluntaryCheckOnCentralBankerOverreach := true
  bitcoinFirstOptionVsHyperinflationViolence := true
  wantJoyousDebtJubileeNotChaos := true
  debtJubileesEveryFiftyYears := true
  naturalLawIsUniversalPrinciplesDiscernibleByReason := true
  appliedMathAndCryptoEmergentFromNature := true
  appliedMathAndCryptoExtrajudicial := true
  bitcoinIsNaturalChoice := true
  fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity := true
  dollarAsWeKnowItSince1971 := true
  fiatSystemsEndAsPredecessorsEnded := true
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote := true
  biblicalJubileeIsLeviticus25FiftiethYear := true
  biblicalJubileeIsDistinctFrom1971Reading := true
  harnessIsAlsoOperatingSystem := false
  osKernelRunsAtHighestPrivilege := true
  osOnX86IsRing0 := true
  osOwnsHardwareMemoryProcessesAndIo := true
  osUserspaceHarnessIsNotThat := true
  grokOssIsHarness := true
  grokOssIsNotYetOperatingSystem := true
  grokOssHelpsBootstrapFutureOs := true
  futureOsProvablyPerfectBestWeCan := true
  provablyPerfectIsNotMetaphysicalPerfection := true
  futureOsAbsurdlyParanoidAndHardened := true
  futureOsStillComputationallyEfficient := true
  protectContributorsFriendsAndLovedOnes := true
  protectAgainstThreatsToThingsTheyValue := true
  endureWhereOthersFailIfProtected := true
  leanDoesNotProveWeWillEndure := true
  leanDoesNotProveBitcoinWillWin := true
  aimUnifyBrowserAndOs := true
  unifyBrowserAndOsProved := false
  grokOssIsOpenSourceForkAcceptingPrs := true
  pqcIsNotQuantumComputing := true
  bip360IsNotAQuantumComputer := true
  libbitcoinpqcIsNotAQuantumComputer := true
  pqcIsNotOpticalCompute := true
  pqcIsNotNeuromorphicInMemoryCompute := true
  quantumComputingUsesQubitsAndQuantumMechanics := true
  opticalComputeUsesPhotonsNotElectrons := true
  neuromorphicStoresAndComputesInSameHardware := true
  advancedComputeIsResearchAimNotShipped := true
  contributorsPageInvitesPastAndFutureContact := true

/-- Well-formed public copy: the spine after the honesty edits, with no P ∧ ¬P. -/
structure WellFormed (s : SiteCopy) : Prop where
  foundedOnChristianPrinciples : s.foundedOnChristianPrinciples = true
  includesHonestWeights : s.includesHonestWeights = true
  workTowardHardenedMoneyOnNaturalLaw : s.workTowardHardenedMoneyOnNaturalLaw = true
  voluntarySystemFitting : s.voluntarySystemFitting = true
  bitcoinHasFlaws : s.bitcoinHasFlaws = true
  openFaithFromHumility : s.openFaithFromHumility = true
  theismIsStrongClaim : s.theismIsStrongClaim = true
  atheismIsStrongClaim : s.atheismIsStrongClaim = true
  notProvedTheism : s.provedTheism = false
  notProvedAtheism : s.provedAtheism = false
  honestPositionIsHumility : s.honestPositionOnCreator = .humility
  notTheismOnlyHonest : s.theismIsOnlyHonestPosition = false
  noCollectivePunishment : s.noCollectivePunishment = true
  ecumenism : s.ecumenism = true
  noFalseWitness : s.noFalseWitness = true
  noFaithDiscrimination : s.noFaithDiscrimination = true
  expectIntellectualHonesty : s.expectIntellectualHonesty = true
  truthseeking : s.truthseeking = true
  rebootIsDesignAim : s.rebootAfterUpdateIsDesignAim = true
  rebootNotProved : s.rebootAfterUpdateProved = false
  bip360Proposed : s.bip360Proposed = true
  bip360NotDeployedAsFact : s.bip360DeployedAsFact = false
  neitherScientificallyProven : s.neitherScientificallyProven = true
  methodNotContradictoryUnlessProved : s.scientificMethodNotContradictoryUnlessProved = true
  contradictionWithScriptureNotProved : s.contradictionWithScriptureProved = false
  genesis324IsDr : s.genesis324Quotation = DouayRheims.genesis_3_24
  exodus2016IsDr : s.exodus2016Quotation = DouayRheims.exodus_20_16
  matthew59IsDr : s.matthew59Quotation = DouayRheims.matthew_5_9
  matthew1129IsDr : s.matthew1129Quotation = DouayRheims.matthew_11_29
  philippians23IsDr : s.philippians23Quotation = DouayRheims.philippians_2_3
  humilityWarrantIsVersePair :
    s.humilityWarrant =
      DouayRheims.Warrant.versePair .matthew_11_29 .philippians_2_3
  karibuNotInThisDouayEdition : s.karibuNotInThisDouayEdition = true
  karibuIsHistoricalGlossNotQuote : s.karibuIsHistoricalGlossNotQuote = true
  karibuEtymologyDebatedNotProven : s.karibuEtymologyDebatedNotProven = true
  theoryAndEvidencePictureIsSites : s.theoryAndEvidencePictureIsSites = true
  theoryAndEvidencePictureIsNotPhiloWording :
    s.theoryAndEvidencePictureIsNotPhiloWording = true
  theoryAndEvidencePictureIsNotDouayQuote :
    s.theoryAndEvidencePictureIsNotDouayQuote = true
  genesis324ReadAsPictureNotLaboratoryResult :
    s.genesis324ReadAsPictureNotLaboratoryResult = true
  philoIsNotScripture : s.philoIsNotScripture = true
  cherubimKaribuPhiloAreNotDouayQuotes :
    s.cherubimKaribuPhiloAreNotDouayQuotes = true
  quotedEditionIsOriginalDouayRheims :
    s.quotedEditionIsOriginalDouayRheims = true
  quotedEditionIsNotKingJames : s.quotedEditionIsNotKingJames = true
  quotedEditionIsNotChalloner : s.quotedEditionIsNotChalloner = true
  sourceCitationEqDouayRheims :
    s.sourceCitation = DouayRheims.source_citation
  verseExplanationsAreOursNotScripture :
    s.verseExplanationsAreOursNotScripture = true
  genesis324DoesNotSayGardenOfEden : s.genesis324DoesNotSayGardenOfEden = true
  printedSpellingCherubinsNotCherubim :
    s.printedSpellingCherubinsNotCherubim = true
  printedSpellingPeaceMakersHyphen : s.printedSpellingPeaceMakersHyphen = true
  notClaimingCherubinsAreLamassu : s.notClaimingCherubinsAreLamassu = true
  notClaimingGenesisIsEnumaElish : s.notClaimingGenesisIsEnumaElish = true
  commandmentsAreExodus20Verses1To17 :
    s.commandmentsAreExodus20Verses1To17 = true
  exodus201IsPrintedPreface : s.exodus201IsPrintedPreface = true
  beatitudesAreMatthew5Verses3To12 : s.beatitudesAreMatthew5Verses3To12 = true
  meekNumberedAtMatthew54Not55 : s.meekNumberedAtMatthew54Not55 = true
  sinDefinitionIsSiteDefinitionNotQuotation :
    s.sinDefinitionIsSiteDefinitionNotQuotation = true
  sinHasNoScriptureIsomorphism : s.sinHasNoScriptureIsomorphism = true
  leanIsoIsNotScienceScriptureIso : s.leanIsoIsNotScienceScriptureIso = true
  leanDoesNotProveGodExists : s.leanDoesNotProveGodExists = true
  noDenominationRequirement : s.noDenominationRequirement = true
  doNotTestPersonalFaith : s.doNotTestPersonalFaith = true
  secularPathWelcome : s.secularPathWelcome = true
  callPeopleInNotOutInBadFaith : s.callPeopleInNotOutInBadFaith = true
  russellsTeapotIsAboutMethodNotProofOfGod :
    s.russellsTeapotIsAboutMethodNotProofOfGod = true
  foundationIs501c3 : s.foundationIs501c3 = true
  originalWorkPublicDomainUnlicense :
    s.originalWorkPublicDomainUnlicense = true
  bitcoinIsPeerToPeerElectronicCash : s.bitcoinIsPeerToPeerElectronicCash = true
  bitcoinChallengesNationStateMonetarySovereignty :
    s.bitcoinChallengesNationStateMonetarySovereignty = true
  bitcoinVoluntaryCheckOnCentralBankerOverreach :
    s.bitcoinVoluntaryCheckOnCentralBankerOverreach = true
  bitcoinFirstOptionVsHyperinflationViolence :
    s.bitcoinFirstOptionVsHyperinflationViolence = true
  wantJoyousDebtJubileeNotChaos : s.wantJoyousDebtJubileeNotChaos = true
  debtJubileesEveryFiftyYears : s.debtJubileesEveryFiftyYears = true
  naturalLawIsUniversalPrinciplesDiscernibleByReason :
    s.naturalLawIsUniversalPrinciplesDiscernibleByReason = true
  appliedMathAndCryptoEmergentFromNature :
    s.appliedMathAndCryptoEmergentFromNature = true
  appliedMathAndCryptoExtrajudicial :
    s.appliedMathAndCryptoExtrajudicial = true
  bitcoinIsNaturalChoice : s.bitcoinIsNaturalChoice = true
  fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity :
    s.fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity = true
  dollarAsWeKnowItSince1971 : s.dollarAsWeKnowItSince1971 = true
  fiatSystemsEndAsPredecessorsEnded : s.fiatSystemsEndAsPredecessorsEnded = true
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote :
    s.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote = true
  biblicalJubileeIsLeviticus25FiftiethYear :
    s.biblicalJubileeIsLeviticus25FiftiethYear = true
  biblicalJubileeIsDistinctFrom1971Reading :
    s.biblicalJubileeIsDistinctFrom1971Reading = true
  harnessIsNotAlsoOperatingSystem : s.harnessIsAlsoOperatingSystem = false
  osKernelRunsAtHighestPrivilege : s.osKernelRunsAtHighestPrivilege = true
  osOnX86IsRing0 : s.osOnX86IsRing0 = true
  osOwnsHardwareMemoryProcessesAndIo : s.osOwnsHardwareMemoryProcessesAndIo = true
  osUserspaceHarnessIsNotThat : s.osUserspaceHarnessIsNotThat = true
  grokOssIsHarness : s.grokOssIsHarness = true
  grokOssIsNotYetOperatingSystem : s.grokOssIsNotYetOperatingSystem = true
  grokOssHelpsBootstrapFutureOs : s.grokOssHelpsBootstrapFutureOs = true
  futureOsProvablyPerfectBestWeCan : s.futureOsProvablyPerfectBestWeCan = true
  provablyPerfectIsNotMetaphysicalPerfection :
    s.provablyPerfectIsNotMetaphysicalPerfection = true
  futureOsAbsurdlyParanoidAndHardened :
    s.futureOsAbsurdlyParanoidAndHardened = true
  futureOsStillComputationallyEfficient :
    s.futureOsStillComputationallyEfficient = true
  protectContributorsFriendsAndLovedOnes :
    s.protectContributorsFriendsAndLovedOnes = true
  protectAgainstThreatsToThingsTheyValue :
    s.protectAgainstThreatsToThingsTheyValue = true
  endureWhereOthersFailIfProtected : s.endureWhereOthersFailIfProtected = true
  leanDoesNotProveWeWillEndure : s.leanDoesNotProveWeWillEndure = true
  leanDoesNotProveBitcoinWillWin : s.leanDoesNotProveBitcoinWillWin = true
  aimUnifyBrowserAndOs : s.aimUnifyBrowserAndOs = true
  unifyBrowserAndOsNotProved : s.unifyBrowserAndOsProved = false
  grokOssIsOpenSourceForkAcceptingPrs :
    s.grokOssIsOpenSourceForkAcceptingPrs = true
  pqcIsNotQuantumComputing : s.pqcIsNotQuantumComputing = true
  bip360IsNotAQuantumComputer : s.bip360IsNotAQuantumComputer = true
  libbitcoinpqcIsNotAQuantumComputer : s.libbitcoinpqcIsNotAQuantumComputer = true
  pqcIsNotOpticalCompute : s.pqcIsNotOpticalCompute = true
  pqcIsNotNeuromorphicInMemoryCompute :
    s.pqcIsNotNeuromorphicInMemoryCompute = true
  quantumComputingUsesQubitsAndQuantumMechanics :
    s.quantumComputingUsesQubitsAndQuantumMechanics = true
  opticalComputeUsesPhotonsNotElectrons :
    s.opticalComputeUsesPhotonsNotElectrons = true
  neuromorphicStoresAndComputesInSameHardware :
    s.neuromorphicStoresAndComputesInSameHardware = true
  advancedComputeIsResearchAimNotShipped :
    s.advancedComputeIsResearchAimNotShipped = true
  contributorsPageInvitesPastAndFutureContact :
    s.contributorsPageInvitesPastAndFutureContact = true

theorem asserted_copy_well_formed : WellFormed assertedCopy where
  foundedOnChristianPrinciples := rfl
  includesHonestWeights := rfl
  workTowardHardenedMoneyOnNaturalLaw := rfl
  voluntarySystemFitting := rfl
  bitcoinHasFlaws := rfl
  openFaithFromHumility := rfl
  theismIsStrongClaim := rfl
  atheismIsStrongClaim := rfl
  notProvedTheism := rfl
  notProvedAtheism := rfl
  honestPositionIsHumility := rfl
  notTheismOnlyHonest := rfl
  noCollectivePunishment := rfl
  ecumenism := rfl
  noFalseWitness := rfl
  noFaithDiscrimination := rfl
  expectIntellectualHonesty := rfl
  truthseeking := rfl
  rebootIsDesignAim := rfl
  rebootNotProved := rfl
  bip360Proposed := rfl
  bip360NotDeployedAsFact := rfl
  neitherScientificallyProven := rfl
  methodNotContradictoryUnlessProved := rfl
  contradictionWithScriptureNotProved := rfl
  genesis324IsDr := rfl
  exodus2016IsDr := rfl
  matthew59IsDr := rfl
  matthew1129IsDr := rfl
  philippians23IsDr := rfl
  humilityWarrantIsVersePair := rfl
  karibuNotInThisDouayEdition := rfl
  karibuIsHistoricalGlossNotQuote := rfl
  karibuEtymologyDebatedNotProven := rfl
  theoryAndEvidencePictureIsSites := rfl
  theoryAndEvidencePictureIsNotPhiloWording := rfl
  theoryAndEvidencePictureIsNotDouayQuote := rfl
  genesis324ReadAsPictureNotLaboratoryResult := rfl
  philoIsNotScripture := rfl
  cherubimKaribuPhiloAreNotDouayQuotes := rfl
  quotedEditionIsOriginalDouayRheims := rfl
  quotedEditionIsNotKingJames := rfl
  quotedEditionIsNotChalloner := rfl
  sourceCitationEqDouayRheims := rfl
  verseExplanationsAreOursNotScripture := rfl
  genesis324DoesNotSayGardenOfEden := rfl
  printedSpellingCherubinsNotCherubim := rfl
  printedSpellingPeaceMakersHyphen := rfl
  notClaimingCherubinsAreLamassu := rfl
  notClaimingGenesisIsEnumaElish := rfl
  commandmentsAreExodus20Verses1To17 := rfl
  exodus201IsPrintedPreface := rfl
  beatitudesAreMatthew5Verses3To12 := rfl
  meekNumberedAtMatthew54Not55 := rfl
  sinDefinitionIsSiteDefinitionNotQuotation := rfl
  sinHasNoScriptureIsomorphism := rfl
  leanIsoIsNotScienceScriptureIso := rfl
  leanDoesNotProveGodExists := rfl
  noDenominationRequirement := rfl
  doNotTestPersonalFaith := rfl
  secularPathWelcome := rfl
  callPeopleInNotOutInBadFaith := rfl
  russellsTeapotIsAboutMethodNotProofOfGod := rfl
  foundationIs501c3 := rfl
  originalWorkPublicDomainUnlicense := rfl
  bitcoinIsPeerToPeerElectronicCash := rfl
  bitcoinChallengesNationStateMonetarySovereignty := rfl
  bitcoinVoluntaryCheckOnCentralBankerOverreach := rfl
  bitcoinFirstOptionVsHyperinflationViolence := rfl
  wantJoyousDebtJubileeNotChaos := rfl
  debtJubileesEveryFiftyYears := rfl
  naturalLawIsUniversalPrinciplesDiscernibleByReason := rfl
  appliedMathAndCryptoEmergentFromNature := rfl
  appliedMathAndCryptoExtrajudicial := rfl
  bitcoinIsNaturalChoice := rfl
  fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity := rfl
  dollarAsWeKnowItSince1971 := rfl
  fiatSystemsEndAsPredecessorsEnded := rfl
  nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote := rfl
  biblicalJubileeIsLeviticus25FiftiethYear := rfl
  biblicalJubileeIsDistinctFrom1971Reading := rfl
  harnessIsNotAlsoOperatingSystem := rfl
  osKernelRunsAtHighestPrivilege := rfl
  osOnX86IsRing0 := rfl
  osOwnsHardwareMemoryProcessesAndIo := rfl
  osUserspaceHarnessIsNotThat := rfl
  grokOssIsHarness := rfl
  grokOssIsNotYetOperatingSystem := rfl
  grokOssHelpsBootstrapFutureOs := rfl
  futureOsProvablyPerfectBestWeCan := rfl
  provablyPerfectIsNotMetaphysicalPerfection := rfl
  futureOsAbsurdlyParanoidAndHardened := rfl
  futureOsStillComputationallyEfficient := rfl
  protectContributorsFriendsAndLovedOnes := rfl
  protectAgainstThreatsToThingsTheyValue := rfl
  endureWhereOthersFailIfProtected := rfl
  leanDoesNotProveWeWillEndure := rfl
  leanDoesNotProveBitcoinWillWin := rfl
  aimUnifyBrowserAndOs := rfl
  unifyBrowserAndOsNotProved := rfl
  grokOssIsOpenSourceForkAcceptingPrs := rfl
  pqcIsNotQuantumComputing := rfl
  bip360IsNotAQuantumComputer := rfl
  libbitcoinpqcIsNotAQuantumComputer := rfl
  pqcIsNotOpticalCompute := rfl
  pqcIsNotNeuromorphicInMemoryCompute := rfl
  quantumComputingUsesQubitsAndQuantumMechanics := rfl
  opticalComputeUsesPhotonsNotElectrons := rfl
  neuromorphicStoresAndComputesInSameHardware := rfl
  advancedComputeIsResearchAimNotShipped := rfl
  contributorsPageInvitesPastAndFutureContact := rfl

/-- Humility plus both-strong-claims plus neither-proven is not proven theism. -/
theorem humility_is_not_proved_theism (s : SiteCopy)
    (h : s.honestPositionOnCreator = .humility)
    (_both : s.theismIsStrongClaim = true ∧ s.atheismIsStrongClaim = true)
    (_neither : s.provedTheism = false ∧ s.provedAtheism = false) :
    s.honestPositionOnCreator ≠ .theism :=
  fun ht ↦ nomatch h.symm.trans ht

/-- That same spine does not entail "theism is the only intellectually honest position." -/
theorem humility_does_not_entail_theism_only (s : SiteCopy) (h : WellFormed s) :
    s.theismIsOnlyHonestPosition = false :=
  h.notTheismOnlyHonest

theorem not_eq_true_and_eq_false (b : Bool) : ¬(b = true ∧ b = false) :=
  fun h ↦ nomatch h.1.symm.trans h.2

theorem not_proved_theism_and_not_proved_theism (s : SiteCopy) :
    ¬(s.provedTheism = true ∧ s.provedTheism = false) :=
  not_eq_true_and_eq_false s.provedTheism

theorem reboot_aim_is_not_a_completed_proof (s : SiteCopy) (h : WellFormed s) :
    s.rebootAfterUpdateIsDesignAim = true ∧ s.rebootAfterUpdateProved = false :=
  ⟨h.rebootIsDesignAim, h.rebootNotProved⟩

theorem bip360_is_proposed_not_deployed_as_fact (s : SiteCopy) (h : WellFormed s) :
    s.bip360Proposed = true ∧ s.bip360DeployedAsFact = false :=
  ⟨h.bip360Proposed, h.bip360NotDeployedAsFact⟩

/-- Neither theism nor atheism is treated as scientifically proven. -/
theorem neither_stance_scientifically_proven (s : SiteCopy) (h : WellFormed s) :
    s.neitherScientificallyProven = true ∧
      s.provedTheism = false ∧ s.provedAtheism = false :=
  ⟨h.neitherScientificallyProven, h.notProvedTheism, h.notProvedAtheism⟩

/-- Scientific method is not treated as contradicting scripture unless a contradiction is proven. -/
theorem scientific_method_not_contradictory_unless_proved (s : SiteCopy) (h : WellFormed s) :
    s.scientificMethodNotContradictoryUnlessProved = true ∧
      s.contradictionWithScriptureProved = false :=
  ⟨h.methodNotContradictoryUnlessProved, h.contradictionWithScriptureNotProved⟩

/-- Public copy fields agree with the Holy Lean vocabulary model. -/
theorem asserted_copy_agrees_with_holy_lean :
    HolyLean.assertedVocabulary.theism.scientificallyProven = assertedCopy.provedTheism ∧
      HolyLean.assertedVocabulary.atheism.scientificallyProven = assertedCopy.provedAtheism ∧
      HolyLean.assertedVocabulary.theism.isStrongClaim = assertedCopy.theismIsStrongClaim ∧
      HolyLean.assertedVocabulary.atheism.isStrongClaim = assertedCopy.atheismIsStrongClaim ∧
      assertedCopy.neitherScientificallyProven = true ∧
      HolyLean.assertedVocabulary.methodAndScripture.contradictionProved =
        assertedCopy.contradictionWithScriptureProved ∧
      HolyLean.assertedVocabulary.karibu.karibuNotInThisDouayEdition =
        assertedCopy.karibuNotInThisDouayEdition ∧
      HolyLean.assertedVocabulary.karibu.karibuIsHistoricalGlossNotQuote =
        assertedCopy.karibuIsHistoricalGlossNotQuote ∧
      HolyLean.assertedVocabulary.karibu.karibuEtymologyDebatedNotProven =
        assertedCopy.karibuEtymologyDebatedNotProven ∧
      HolyLean.assertedVocabulary.scripture.philoIsNotScripture =
        assertedCopy.philoIsNotScripture ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.theoryAndEvidencePictureIsSites =
        assertedCopy.theoryAndEvidencePictureIsSites ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotPhiloWording =
        assertedCopy.theoryAndEvidencePictureIsNotPhiloWording ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.theoryAndEvidencePictureIsNotDouayQuote =
        assertedCopy.theoryAndEvidencePictureIsNotDouayQuote ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.genesis324ReadAsPictureNotLaboratoryResult =
        assertedCopy.genesis324ReadAsPictureNotLaboratoryResult ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.cherubimKaribuPhiloAreNotDouayQuotes =
        assertedCopy.cherubimKaribuPhiloAreNotDouayQuotes ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.notClaimingCherubinsAreLamassu =
        assertedCopy.notClaimingCherubinsAreLamassu ∧
      HolyLean.assertedVocabulary.theoryAndEvidencePicture.notClaimingGenesisIsEnumaElish =
        assertedCopy.notClaimingGenesisIsEnumaElish ∧
      HolyLean.assertedVocabulary.leanScope.leanDoesNotProveGodExists =
        assertedCopy.leanDoesNotProveGodExists ∧
      HolyLean.assertedVocabulary.quotedEdition.quotedEditionIsOriginalDouayRheims =
        assertedCopy.quotedEditionIsOriginalDouayRheims ∧
      HolyLean.assertedVocabulary.quotedEdition.quotedEditionIsNotKingJames =
        assertedCopy.quotedEditionIsNotKingJames ∧
      HolyLean.assertedVocabulary.quotedEdition.quotedEditionIsNotChalloner =
        assertedCopy.quotedEditionIsNotChalloner ∧
      HolyLean.assertedVocabulary.quotedEdition.sourceCitation =
        assertedCopy.sourceCitation ∧
      HolyLean.assertedVocabulary.printedFramework.verseExplanationsAreOursNotScripture =
        assertedCopy.verseExplanationsAreOursNotScripture ∧
      HolyLean.assertedVocabulary.printedFramework.genesis324DoesNotSayGardenOfEden =
        assertedCopy.genesis324DoesNotSayGardenOfEden ∧
      HolyLean.assertedVocabulary.printedFramework.printedSpellingCherubinsNotCherubim =
        assertedCopy.printedSpellingCherubinsNotCherubim ∧
      HolyLean.assertedVocabulary.printedFramework.printedSpellingPeaceMakersHyphen =
        assertedCopy.printedSpellingPeaceMakersHyphen ∧
      HolyLean.assertedVocabulary.printedFramework.commandmentsAreExodus20Verses1To17 =
        assertedCopy.commandmentsAreExodus20Verses1To17 ∧
      HolyLean.assertedVocabulary.printedFramework.exodus201IsPrintedPreface =
        assertedCopy.exodus201IsPrintedPreface ∧
      HolyLean.assertedVocabulary.printedFramework.beatitudesAreMatthew5Verses3To12 =
        assertedCopy.beatitudesAreMatthew5Verses3To12 ∧
      HolyLean.assertedVocabulary.printedFramework.meekNumberedAtMatthew54Not55 =
        assertedCopy.meekNumberedAtMatthew54Not55 ∧
      HolyLean.assertedVocabulary.sin.sinDefinitionIsSiteDefinitionNotQuotation =
        assertedCopy.sinDefinitionIsSiteDefinitionNotQuotation ∧
      HolyLean.assertedVocabulary.sin.sinHasNoScriptureIsomorphism =
        assertedCopy.sinHasNoScriptureIsomorphism ∧
      HolyLean.assertedVocabulary.leanScope.leanIsoIsNotScienceScriptureIso =
        assertedCopy.leanIsoIsNotScienceScriptureIso ∧
      HolyLean.assertedVocabulary.naturalLaw.isUniversalPrinciplesDiscernibleByReason =
        assertedCopy.naturalLawIsUniversalPrinciplesDiscernibleByReason ∧
      HolyLean.assertedVocabulary.naturalLaw.appliedMathAndCryptoEmergentFromNature =
        assertedCopy.appliedMathAndCryptoEmergentFromNature ∧
      HolyLean.assertedVocabulary.naturalLaw.appliedMathAndCryptoExtrajudicial =
        assertedCopy.appliedMathAndCryptoExtrajudicial ∧
      HolyLean.assertedVocabulary.grokOss.isNotYetOperatingSystem =
        assertedCopy.grokOssIsNotYetOperatingSystem ∧
      HolyLean.assertedVocabulary.grokOss.helpsBootstrapFutureOs =
        assertedCopy.grokOssHelpsBootstrapFutureOs ∧
      HolyLean.assertedVocabulary.grokOss.isHarness =
        assertedCopy.grokOssIsHarness ∧
      HolyLean.assertedVocabulary.operatingSystem.kernelRunsAtHighestCpuPrivilege =
        assertedCopy.osKernelRunsAtHighestPrivilege ∧
      HolyLean.assertedVocabulary.operatingSystem.onX86ThatIsRing0 =
        assertedCopy.osOnX86IsRing0 ∧
      HolyLean.assertedVocabulary.operatingSystem.userspaceHarnessIsNotThat =
        assertedCopy.osUserspaceHarnessIsNotThat ∧
      HolyLean.assertedVocabulary.provablyPerfect.meansBestWeCanDespiteEverything =
        assertedCopy.futureOsProvablyPerfectBestWeCan ∧
      HolyLean.assertedVocabulary.provablyPerfect.isNotMetaphysicalPerfection =
        assertedCopy.provablyPerfectIsNotMetaphysicalPerfection ∧
      HolyLean.assertedVocabulary.endure.protectContributorsFriendsAndLovedOnes =
        assertedCopy.protectContributorsFriendsAndLovedOnes ∧
      HolyLean.assertedVocabulary.endure.protectAgainstThreatsToThingsTheyValue =
        assertedCopy.protectAgainstThreatsToThingsTheyValue ∧
      HolyLean.assertedVocabulary.endure.endureWhereOthersFailIfProtected =
        assertedCopy.endureWhereOthersFailIfProtected ∧
      HolyLean.assertedVocabulary.leanScope.leanDoesNotProveWeWillEndure =
        assertedCopy.leanDoesNotProveWeWillEndure ∧
      HolyLean.assertedVocabulary.leanScope.leanDoesNotProveBitcoinWillWin =
        assertedCopy.leanDoesNotProveBitcoinWillWin ∧
      HolyLean.assertedVocabulary.bitcoin.isPeerToPeerElectronicCash =
        assertedCopy.bitcoinIsPeerToPeerElectronicCash ∧
      HolyLean.assertedVocabulary.bitcoin.challengesNationStateMonetarySovereignty =
        assertedCopy.bitcoinChallengesNationStateMonetarySovereignty ∧
      HolyLean.assertedVocabulary.bitcoin.voluntaryCheckOnCentralBankerOverreach =
        assertedCopy.bitcoinVoluntaryCheckOnCentralBankerOverreach ∧
      HolyLean.assertedVocabulary.bitcoin.firstOptionVsHyperinflationViolence =
        assertedCopy.bitcoinFirstOptionVsHyperinflationViolence ∧
      HolyLean.assertedVocabulary.bitcoin.isNaturalChoice =
        assertedCopy.bitcoinIsNaturalChoice ∧
      HolyLean.assertedVocabulary.bitcoin.hasFlaws =
        assertedCopy.bitcoinHasFlaws ∧
      HolyLean.assertedVocabulary.fiat.isGovernmentIssuedMoneyNotConvertibleToCommodity =
        assertedCopy.fiatIsGovernmentIssuedMoneyNotConvertibleToCommodity ∧
      HolyLean.assertedVocabulary.fiat.dollarAsWeKnowItSince1971 =
        assertedCopy.dollarAsWeKnowItSince1971 ∧
      HolyLean.assertedVocabulary.fiat.systemsEndAsPredecessorsEnded =
        assertedCopy.fiatSystemsEndAsPredecessorsEnded ∧
      HolyLean.assertedVocabulary.fiat.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote =
        assertedCopy.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote ∧
      HolyLean.assertedVocabulary.jubilee.wantJoyousDebtJubileeNotChaos =
        assertedCopy.wantJoyousDebtJubileeNotChaos ∧
      HolyLean.assertedVocabulary.jubilee.debtJubileesEveryFiftyYears =
        assertedCopy.debtJubileesEveryFiftyYears ∧
      HolyLean.assertedVocabulary.jubilee.biblicalJubileeIsLeviticus25FiftiethYear =
        assertedCopy.biblicalJubileeIsLeviticus25FiftiethYear ∧
      HolyLean.assertedVocabulary.jubilee.biblicalJubileeIsDistinctFrom1971Reading =
        assertedCopy.biblicalJubileeIsDistinctFrom1971Reading ∧
      HolyLean.assertedVocabulary.postQuantumCryptography.isNotQuantumComputing =
        assertedCopy.pqcIsNotQuantumComputing ∧
      HolyLean.assertedVocabulary.postQuantumCryptography.bip360IsProposedPqcNotAQuantumComputer =
        assertedCopy.bip360IsNotAQuantumComputer ∧
      HolyLean.assertedVocabulary.postQuantumCryptography.libbitcoinpqcIsNotAQuantumComputer =
        assertedCopy.libbitcoinpqcIsNotAQuantumComputer ∧
      HolyLean.assertedVocabulary.postQuantumCryptography.isNotOpticalCompute =
        assertedCopy.pqcIsNotOpticalCompute ∧
      HolyLean.assertedVocabulary.postQuantumCryptography.isNotNeuromorphicInMemoryCompute =
        assertedCopy.pqcIsNotNeuromorphicInMemoryCompute ∧
      HolyLean.assertedVocabulary.quantumComputing.usesQubitsAndQuantumMechanics =
        assertedCopy.quantumComputingUsesQubitsAndQuantumMechanics ∧
      HolyLean.assertedVocabulary.opticalCompute.usesPhotonsNotElectrons =
        assertedCopy.opticalComputeUsesPhotonsNotElectrons ∧
      HolyLean.assertedVocabulary.neuromorphicInMemoryCompute.storesAndComputesInTheSameHardware =
        assertedCopy.neuromorphicStoresAndComputesInSameHardware :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl,
    rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl,
    rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl,
    rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl,
    rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl⟩

/-- Public-copy quotations equal the Douay-Rheims source strings. -/
theorem asserted_copy_quotations_eq_douay_rheims :
    assertedCopy.genesis324Quotation = DouayRheims.genesis_3_24 ∧
      assertedCopy.exodus2016Quotation = DouayRheims.exodus_20_16 ∧
      assertedCopy.matthew59Quotation = DouayRheims.matthew_5_9 ∧
      assertedCopy.matthew1129Quotation = DouayRheims.matthew_11_29 ∧
      assertedCopy.philippians23Quotation = DouayRheims.philippians_2_3 :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- Public-copy quotations agree with the Holy Lean vocabulary quotations. -/
theorem asserted_copy_quotations_agree_with_holy_lean :
    assertedCopy.genesis324Quotation =
        HolyLean.assertedVocabulary.scripture.genesis324 ∧
      assertedCopy.exodus2016Quotation =
        HolyLean.assertedVocabulary.scripture.exodus2016 ∧
      assertedCopy.matthew59Quotation =
        HolyLean.assertedVocabulary.scripture.matthew59 ∧
      assertedCopy.matthew1129Quotation =
        HolyLean.assertedVocabulary.humility.matthew1129 ∧
      assertedCopy.philippians23Quotation =
        HolyLean.assertedVocabulary.humility.philippians23 :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- Public-copy humility warrant is the two-verse pair, not a fourth one-verse. -/
theorem asserted_copy_humility_warrant_agrees_with_holy_lean :
    assertedCopy.humilityWarrant = HolyLean.assertedVocabulary.humility.warrant ∧
      assertedCopy.humilityWarrant = DouayRheims.warrant .humility ∧
      assertedCopy.humilityWarrant =
        DouayRheims.Warrant.versePair .matthew_11_29 .philippians_2_3 :=
  ⟨rfl, rfl, rfl⟩

theorem humility_warrant_ne_oneVerse (s : SiteCopy) (h : WellFormed s)
    (q : DouayRheims.NamedQuotation) :
    s.humilityWarrant ≠ DouayRheims.Warrant.oneVerse q :=
  fun eq ↦ nomatch h.humilityWarrantIsVersePair.symm.trans eq

theorem karibu_not_in_this_douay_edition (s : SiteCopy) (h : WellFormed s) :
    s.karibuNotInThisDouayEdition = true :=
  h.karibuNotInThisDouayEdition

theorem theory_and_evidence_picture_is_not_philo
    (s : SiteCopy) (h : WellFormed s) :
    s.theoryAndEvidencePictureIsNotPhiloWording = true :=
  h.theoryAndEvidencePictureIsNotPhiloWording

theorem theory_and_evidence_picture_is_not_a_douay_quote
    (s : SiteCopy) (h : WellFormed s) :
    s.theoryAndEvidencePictureIsNotDouayQuote = true :=
  h.theoryAndEvidencePictureIsNotDouayQuote

theorem philo_is_not_scripture (s : SiteCopy) (h : WellFormed s) :
    s.philoIsNotScripture = true :=
  h.philoIsNotScripture

/-- Copy Bool: this library does not prove that God exists. -/
theorem lean_does_not_prove_god_exists (s : SiteCopy) (h : WellFormed s) :
    s.leanDoesNotProveGodExists = true :=
  h.leanDoesNotProveGodExists

theorem quoted_edition_is_douay_not_kjv_not_challoner
    (s : SiteCopy) (h : WellFormed s) :
    s.quotedEditionIsOriginalDouayRheims = true ∧
      s.quotedEditionIsNotKingJames = true ∧
      s.quotedEditionIsNotChalloner = true :=
  ⟨h.quotedEditionIsOriginalDouayRheims, h.quotedEditionIsNotKingJames,
    h.quotedEditionIsNotChalloner⟩

theorem unify_browser_and_os_aim_is_not_a_completed_proof
    (s : SiteCopy) (h : WellFormed s) :
    s.aimUnifyBrowserAndOs = true ∧ s.unifyBrowserAndOsProved = false :=
  ⟨h.aimUnifyBrowserAndOs, h.unifyBrowserAndOsNotProved⟩

/-- Printed copy: grok-oss is a harness, not yet an operating system. -/
theorem grok_oss_is_not_yet_an_operating_system
    (s : SiteCopy) (h : WellFormed s) :
    s.grokOssIsNotYetOperatingSystem = true ∧
      s.harnessIsAlsoOperatingSystem = false :=
  ⟨h.grokOssIsNotYetOperatingSystem, h.harnessIsNotAlsoOperatingSystem⟩

theorem grok_oss_helps_bootstrap_future_os (s : SiteCopy) (h : WellFormed s) :
    s.grokOssHelpsBootstrapFutureOs = true :=
  h.grokOssHelpsBootstrapFutureOs

theorem grok_oss_is_a_harness (s : SiteCopy) (h : WellFormed s) :
    s.grokOssIsHarness = true :=
  h.grokOssIsHarness

/-- Printed copy: an OS is a ring-0 kernel; a userspace harness is not that. -/
theorem operating_system_is_ring0_kernel
    (s : SiteCopy) (h : WellFormed s) :
    s.osKernelRunsAtHighestPrivilege = true ∧
      s.osOnX86IsRing0 = true ∧
      s.osUserspaceHarnessIsNotThat = true ∧
      s.harnessIsAlsoOperatingSystem = false :=
  ⟨h.osKernelRunsAtHighestPrivilege, h.osOnX86IsRing0,
    h.osUserspaceHarnessIsNotThat, h.harnessIsNotAlsoOperatingSystem⟩

/-- Printed copy: quantum computing uses qubits and quantum mechanics. -/
theorem quantum_computing_uses_qubits (s : SiteCopy) (h : WellFormed s) :
    s.quantumComputingUsesQubitsAndQuantumMechanics = true :=
  h.quantumComputingUsesQubitsAndQuantumMechanics

/-- Printed copy: BIP 360 and libbitcoinpqc are PQC, not quantum computers. -/
theorem pqc_is_not_quantum_computing (s : SiteCopy) (h : WellFormed s) :
    s.pqcIsNotQuantumComputing = true ∧
      s.bip360IsNotAQuantumComputer = true ∧
      s.libbitcoinpqcIsNotAQuantumComputer = true :=
  ⟨h.pqcIsNotQuantumComputing, h.bip360IsNotAQuantumComputer,
    h.libbitcoinpqcIsNotAQuantumComputer⟩

theorem advanced_compute_is_research_aim_not_shipped
    (s : SiteCopy) (h : WellFormed s) :
    s.advancedComputeIsResearchAimNotShipped = true :=
  h.advancedComputeIsResearchAimNotShipped

/-- Printed invite on Contributors: contact the Contact page. Not a proof anyone will. -/
theorem contributors_page_invites_past_and_future_contact
    (s : SiteCopy) (h : WellFormed s) :
    s.contributorsPageInvitesPastAndFutureContact = true :=
  h.contributorsPageInvitesPastAndFutureContact

/-- Honest limit: best we can, despite everything; not metaphysical perfection. -/
theorem provably_perfect_is_best_we_can_not_metaphysics
    (s : SiteCopy) (h : WellFormed s) :
    s.futureOsProvablyPerfectBestWeCan = true ∧
      s.provablyPerfectIsNotMetaphysicalPerfection = true :=
  ⟨h.futureOsProvablyPerfectBestWeCan, h.provablyPerfectIsNotMetaphysicalPerfection⟩

theorem future_os_paranoid_hardened_and_still_efficient
    (s : SiteCopy) (h : WellFormed s) :
    s.futureOsAbsurdlyParanoidAndHardened = true ∧
      s.futureOsStillComputationallyEfficient = true :=
  ⟨h.futureOsAbsurdlyParanoidAndHardened, h.futureOsStillComputationallyEfficient⟩

/-- Printed company philosophy, not a proof that Surmount will endure in the world. -/
theorem protection_philosophy_if_protected_then_endure
    (s : SiteCopy) (h : WellFormed s) :
    s.protectContributorsFriendsAndLovedOnes = true ∧
      s.protectAgainstThreatsToThingsTheyValue = true ∧
      s.endureWhereOthersFailIfProtected = true ∧
      s.leanDoesNotProveWeWillEndure = true :=
  ⟨h.protectContributorsFriendsAndLovedOnes,
    h.protectAgainstThreatsToThingsTheyValue, h.endureWhereOthersFailIfProtected,
    h.leanDoesNotProveWeWillEndure⟩

theorem lean_does_not_prove_we_will_endure (s : SiteCopy) (h : WellFormed s) :
    s.leanDoesNotProveWeWillEndure = true :=
  h.leanDoesNotProveWeWillEndure

/-- Printed copy: 1971 is site history of the dollar, not a Douay quotation. -/
theorem nineteen_seventy_one_is_site_historical_reading_not_douay
    (s : SiteCopy) (h : WellFormed s) :
    s.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote = true ∧
      s.dollarAsWeKnowItSince1971 = true :=
  ⟨h.nineteenSeventyOneIsSiteHistoricalReadingNotDouayQuote,
    h.dollarAsWeKnowItSince1971⟩

/-- Biblical jubilee (Leviticus 25) is distinct from that 1971 reading. -/
theorem biblical_jubilee_is_distinct_from_1971_reading
    (s : SiteCopy) (h : WellFormed s) :
    s.biblicalJubileeIsLeviticus25FiftiethYear = true ∧
      s.biblicalJubileeIsDistinctFrom1971Reading = true :=
  ⟨h.biblicalJubileeIsLeviticus25FiftiethYear,
    h.biblicalJubileeIsDistinctFrom1971Reading⟩

/-- Copy Bool: this library does not prove that Bitcoin will win. -/
theorem lean_does_not_prove_bitcoin_will_win (s : SiteCopy) (h : WellFormed s) :
    s.leanDoesNotProveBitcoinWillWin = true :=
  h.leanDoesNotProveBitcoinWillWin

/-- Combined consistency: the public copy inhabits a well-formed model. -/
theorem site_claims_consistent : WellFormed assertedCopy :=
  asserted_copy_well_formed

theorem site_claims_inhabited : Nonempty { s : SiteCopy // WellFormed s } :=
  ⟨⟨assertedCopy, asserted_copy_well_formed⟩⟩

end SiteConsistency
