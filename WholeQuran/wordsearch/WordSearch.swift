//
//  WordSearch.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

private let ENDINGS = ["", "َ", "ً", "ُ", "ٌ", "َ", "ً", "َِ", "ٍ", "ا"]

private let SHADDA = "ّ"
private let FATHA = "َ"
private let FATHATAN = "ً"
private let KASRA = "ِ"
private let KASRA2 = "ٍ"
private let DAMMA = "ُ"
private let DAMMATAN = "ٌ"
private let HAMSA = "ٔ"

private let SF = SHADDA + FATHA
private let SFN = SHADDA + FATHATAN
private let SD = SHADDA + DAMMA
private let SDN = SHADDA + DAMMATAN
private let SK = SHADDA + KASRA
private let SK2 = SHADDA + KASRA2
private let SH = SHADDA + HAMSA

private let FS = FATHA + SHADDA
private let FNS = FATHATAN + SHADDA
private let DNS = DAMMATAN + SHADDA
private let DS = DAMMA + SHADDA
private let KS = KASRA + SHADDA
private let KS2 = KASRA2 + SHADDA
private let HS = HAMSA + SHADDA

private let FH = FATHA + HAMSA
private let HF = HAMSA + FATHA

private let ALEF = "ا"
private let MADDA = "ٓ"
private let ALEF_MADDA = ALEF + MADDA
private let ALEFMADDA = "آ"

struct WordSearch<Corpus: CorpusModel, CorpusPivot: CorpusPivotModel> {
    let corpus: Corpus
    let corpusPivot: CorpusPivot

    static func sanityFathaShadda(text: String) -> String {
        text.replacingOccurrences(of: FS, with: SF)
            .replacingOccurrences(of: FNS, with: SFN)
            .replacingOccurrences(of: DS, with: SD)
            .replacingOccurrences(of: DNS, with: SDN)
            .replacingOccurrences(of: KS, with: SK)
            .replacingOccurrences(of: HS, with: SH)
            .replacingOccurrences(of: KS2, with: SK2)
            .replacingOccurrences(of: FH, with: HF)
            .replacingOccurrences(of: ALEFMADDA, with: ALEF_MADDA)
    }

    private func positions(entry: CorpusPivot.CorpusPivotEntriesType.Element) -> Set<String> {
        var positions: Set = Set<String>()
        for l in entry.positions {
            positions.insert("\(l.surah):\(l.ayah):\(l.word):\(l.part)")
        }
        return positions
    }

    private func addLEMsFromExact(dest: inout [WordMatches.Lem], entryIndex: String) {
        guard let ce = corpus.by(key: String(entryIndex.wholeQuranRemoveSuffix(":0"))) else {
            return
        }

        // ...let get the LEMs of them ...
        for part in ce.parts {
            let lem = part.lem
            if lem != "" {
                if let entry = corpusPivot.lem.by(key: lem) {
                    // ...and adds the postions of the words with the same lem
                    let matched = WordMatches.Lem(matchedLem: entry.id, indexes: positions(entry: entry))
                    dest.append(matched)
                }
            }
        }
    }

    private func addLEMsFromPart(dest: inout [WordMatches.Lem], partIndex: String) {
        let indexes = partIndex.split(separator: ":")
        let entryIndex = indexes[0] + ":" + indexes[1] + ":" + indexes[2]
        if let ce = corpus.by(key: entryIndex) {
            let part = ce.parts[Int(indexes[3])!]
            let lem = part.lem
            if lem != "" {
                if let entry = corpusPivot.lem.by(key: lem) {
                    // ...and adds the postions of the words with the same lem
                    let matched = WordMatches.Lem(
                        matchedLem: entry.id,
                        indexes: positions(entry: entry)
                    )
                    dest.append(matched)
                }
            }
        }
    }

    func search(sample: String, searchConsonant: Bool = false) -> SearchResult {
        let sampleAT = ArabicText.fromUnicode(sample)
        let sampleArabic = sampleAT.toUnicode()

        var exactMatches = [WordMatches.Exact]()
        var lemMatches = [WordMatches.Lem]()
        var formMatches = [WordMatches.Form]()
        var consonantMatches = [WordMatches.Consonants]()

        // collect exact matches (i.e. the corpus entries differ only by endings)
        for ending in ENDINGS {
            if let entry = corpusPivot.exact.by(key: sampleArabic + ending) {
                let matched = WordMatches.Exact(
                    matchedWord: entry.id,
                    indexes: positions(entry: entry)
                )
                exactMatches.append(matched)
            }
        }

        // collect form matches (i.e. a  participle
        if let entry = corpusPivot.form.by(key: sampleArabic) {
            let matched = WordMatches.Form(
                matchedForm: entry.id,
                indexes: positions(entry: entry)
            )
            formMatches.append(matched)
        }

        // now we know the corpus entries for the samples
        // lets get the LEMs of them and adds the postions of the words with the same lem
        for match in exactMatches {
            for index in match.indexes {
                addLEMsFromExact(dest: &lemMatches, entryIndex: index)
            }
        }

        for match in formMatches {
            for index in match.indexes {
                addLEMsFromPart(dest: &lemMatches, partIndex: index)
            }
        }

        if searchConsonant {
            let sampleConsonant = sampleAT.toConsonants()
            if let entry = corpusPivot.consonant.by(key: sampleConsonant) {
                let matched = WordMatches.Consonants(
                    matchedConsonants: entry.id,
                    indexes: positions(entry: entry)
                )
                consonantMatches.append(matched)
            }
        }

        return SearchResult(
            word: sample,
            exact: exactMatches,
            form: formMatches,
            lem: lemMatches,
            consonant: consonantMatches
        )
    }
}
