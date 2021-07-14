//
//  asserts.swift
//  WholeQuranTests
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation
@testable import WholeQuran
import XCTest

let allah = "ٱللَّهِ"

func assert(title_1: SurahTitleModel) {
    XCTAssertEqual(title_1.no, 1)
    XCTAssertEqual(title_1.arabic, "الفاتحة")
    XCTAssertEqual(title_1.localize, "The Opening")
    XCTAssertEqual(title_1.translit, "Al-Fatihah")
}

func assert<T: SurahTitlesModel>(titles: T) {
    // let arabicTitles = titles.arabic()
    XCTAssertEqual(titles.count, 114)
    assert(title_1: titles[1])

    var n: Int = 0
    for title in titles {
        n += 1
        XCTAssertEqual(n, title.no)
    }
    XCTAssertEqual(titles.count, n)
}

func assert<T: SurahModel>(surah_1: T) {
    XCTAssertEqual(surah_1.no, 1)
    assert(ayah_1_1: surah_1.ayahs[1])
}

func assert<T: AyahModel>(ayah_1_1: T) {
    XCTAssertEqual(ayah_1_1.no, 1)
    XCTAssertEqual(ayah_1_1.arabic[2].word, allah)
}

func assert<T: SurahsModel>(surahs: T) {
    XCTAssertEqual(surahs.count, 114)
    assert(surah_1: surahs[1])

    var n: Int = 0
    for surah in surahs {
        n += 1
        XCTAssertEqual(n, surah.no)
        var nn: Int = 0
        for ayah in surah.ayahs {
            nn += 1
            XCTAssertEqual(nn, ayah.no)
        }
        XCTAssertEqual(surah.ayahs.count, nn)
    }
    XCTAssertEqual(surahs.count, n)
}

func assert<Pivot: SurahsPivotModel, Surahs: SurahsModel>(surahsPivot: Pivot, withSurahs surahs: Surahs) {
    XCTAssertEqual(surahsPivot.count, 18993)

    XCTAssertNil(surahsPivot.by(key: "foo"))

    let aWord = surahs[2].ayahs[3].arabic[4]
    let surahPivotEntry = surahsPivot.by(key: aWord.word)
    XCTAssertEqual(surahPivotEntry?.positions.count ?? 0, 2)
    XCTAssertEqual(surahPivotEntry?.positions[0].surah, 2)
    XCTAssertEqual(surahPivotEntry?.positions[0].ayah, 3)
    XCTAssertEqual(surahPivotEntry?.positions[0].word, 4)
    let sWord =
        surahs[surahPivotEntry!.positions[1].surah]
            .ayahs[surahPivotEntry!.positions[1].ayah]
            .arabic[surahPivotEntry!.positions[1].word]
    XCTAssertEqual(sWord.word, aWord.word)
}

func assert<Corpus: CorpusModel>(corpus: Corpus) {
    XCTAssertEqual(corpus.count, 77429)
    for entry in corpus {
        XCTAssertNotNil(entry.index)
        XCTAssertNotNil(entry.parts)
        for part in entry.parts {
            let form = part.form
            let lem = part.lem
            XCTAssertNotNil(form)
            XCTAssertNotNil(lem)
            XCTAssertNotEqual(form, "1")
            XCTAssertNotEqual("1", lem)
        }
        if let found = corpus.by(key: entry.index) {
            for part in found.parts {
                let form = part.form
                let lem = part.lem
                XCTAssertNotNil(form)
                XCTAssertNotNil(lem)
                XCTAssertNotEqual(form, "1")
                XCTAssertNotEqual("1", lem)
            }
        } else {
            XCTAssert(false, "Can't find in corpus by \(entry.index)")
        }
    }
}

func assertAsSearch<Corpus: CorpusModel, CorpusPivot: CorpusPivotModel>(corpus: Corpus, corpusPivot: CorpusPivot) {
    for lem in corpusPivot.lem {
        for l in lem.positions {
            let position = "\(l.surah):\(l.ayah):\(l.word):\(l.part)"
            let indexes = position.split(separator: ":")
            let entryIndex = indexes[0] + ":" + indexes[1] + ":" + indexes[2]
            if let ce = corpus.by(key: entryIndex) {
                let part = ce.parts[Int(indexes[3])!]
                XCTAssertEqual(lem.id, ArabicText.fromBuckwalter(part.lem).toUnicode())
            }
        }
    }
}
