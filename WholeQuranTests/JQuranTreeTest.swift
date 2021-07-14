//
//  JQuranTreeTest.swift
//  WholeQuranTests
//
//  Created by  Sergey Dolin on 13.07.2021.
//

import Foundation
@testable import WholeQuran
import XCTest

class JQuranTreeTest: XCTestCase {
    let bismiUnicode = "بِسْمِ"
    let bismiBuckwalter = "bisomi"

    let lsuduriUnicode = "ٱلصُّدُورِ"
    let lsuduriBuckwalter = "{lS~uduwri"

    let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")

    func test_ArabicTextFromUnicodeBismi() {
        let unicode = bismiUnicode
        let buckwalter = bismiBuckwalter
        let at = ArabicText.fromEncoding(unicode)
        XCTAssertEqual(unicode, at.toString())
        XCTAssertEqual(buckwalter, at.toBuckwalter())
    }

    func test_ArabicTextFromBuckwalterBismi() {
        let unicode = bismiUnicode
        let buckwalter = bismiBuckwalter
        let at = ArabicText.fromEncoding(buckwalter, .Buckwalter)
        XCTAssertEqual(unicode, at.toString())
        XCTAssertEqual(buckwalter, at.toBuckwalter())
    }

    func test_ArabicTextFromBuckwalterLsuduri() {
        let unicode = lsuduriUnicode
        let buckwalter = lsuduriBuckwalter
        let at = ArabicText.fromEncoding(buckwalter, .Buckwalter)
        XCTAssertEqual(unicode, at.toString())
        XCTAssertEqual(buckwalter, at.toBuckwalter())
    }

    func test_ArabicTextFromUnicodeLsuduri() {
        let unicode = lsuduriUnicode
        let buckwalter = lsuduriBuckwalter
        let at = ArabicText.fromEncoding(unicode)
        XCTAssertEqual(unicode, at.toString())
        XCTAssertEqual(buckwalter, at.toBuckwalter())
    }

    func test_allFromCorpus() {
        for entry in wholeQuran.corpus {
            let buckwalter = entry.buckwalter
            let at = ArabicText.fromEncoding(buckwalter, .Buckwalter)
            let bb = at.toBuckwalter()
            XCTAssertEqual(buckwalter, bb)
            let (s, a, w) = entry.position
            let qw = wholeQuran.surahs[s].ayahs[a].arabic[w]
            let u = at.toUnicode()
            XCTAssertEqual(qw.word, u)
        }
    }

    func test_allFromSurahs() {
        for surah in wholeQuran.surahs {
            for ayah in surah.ayahs {
                for word in ayah.arabic {
                    let at = ArabicText.fromUnicode(word.word)
                    XCTAssertEqual(word.word, at.toUnicode())
                    let corpusEntry = wholeQuran.corpus.by(surah.no, ayah.no, word.no)
                    XCTAssertNotNil(corpusEntry)
                    let buckwalter = corpusEntry!.buckwalter
                    XCTAssertEqual(buckwalter, at.toBuckwalter())
                }
            }
        }
    }
}
