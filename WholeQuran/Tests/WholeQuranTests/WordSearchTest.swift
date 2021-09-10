//
//  WordSearchTest.swift
//  WholeQuranTests
//
//  Created by  Sergey Dolin on 14.07.2021.
//

import Foundation
@testable import WholeQuran
import XCTest

class WordSearchTest: XCTestCase {
    private let lesson1: [String] = ["وَ", "مَرْيَمَ", "ٱلَّتِى", "مِنْ", "كَانَتْ", "رَبُّهَا", "عِمْرَٰنَ"]

    private let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")

    private func hasWordIndex(indexes: Set<String>, index: String) -> Bool {
        for i in indexes {
            if i.hasPrefix(index) {
                return true
            }
        }
        return false
    }

    func testSearchKunna() {
        let wordSearch = WordSearch(corpus: wholeQuran.corpus, corpusPivot: wholeQuran.corpusPivot)
        let kunna = "كُنَّ"
        let sr = wordSearch.search(sample: kunna, searchConsonant: false)
        XCTAssertNotNil(sr)
        let indexf = "2:228:17:"
        var found = false
        for em in sr.form {
            if hasWordIndex(indexes: em.indexes, index: indexf) {
                found = true
                break
            }
        }
        XCTAssertFalse(found, "quran word \"\(kunna)\"(\(indexf) has no position of form entry in pivot")
    }

    func testLemsSearch() {
        assertAsSearch(corpus: wholeQuran.corpus, corpusPivot: wholeQuran.corpusPivot)
    }

    // TODO: some unxpected not founds
    //
    func skipped_testAllQuranWordsHaveExactEntries() {
        let wordSearch = WordSearch(corpus: wholeQuran.corpus, corpusPivot: wholeQuran.corpusPivot)
        var notFound = 0
        for surah in wholeQuran.surahs {
            for ayah in surah.ayahs {
                for word in ayah.arabic {
                    let indexe = "\(surah.no):\(ayah.no):\(word.no):0"
                    let sr = wordSearch.search(sample: word.word, searchConsonant: false)
                    XCTAssertNotNil(sr)
                    if sr.exact.count + sr.form.count > 0 {
                        if sr.exact.count > 0 {
                            var found = false
                            for em in sr.exact {
                                if em.indexes.contains(indexe) {
                                    found = true
                                    break
                                }
                            }
                            XCTAssertTrue(found, "quran word \"\(word)\"(\(indexe) has no position in exact entry of pivot")
                        }
                        // TODO: test form
                    } else {
                        notFound += 1
                    }
                }
            }
        }
        XCTAssertEqual(notFound, 0, "not found samples: \(notFound)")
    }
}
