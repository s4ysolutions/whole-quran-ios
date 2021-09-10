//
//  FlatBuffersTitlesTest.swift
//  WholeQuranTests
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import FlatBuffers
import UIKit
@testable import WholeQuran
import XCTest

class FlatBuffersTest: XCTestCase {
    private lazy var bundle = {
        Bundle(for: type(of: Self.self as AnyObject))
    }()
    
    private lazy var surahTitleData = {
        NSDataAsset(name: "surah_titles", bundle: .module)!.data
    }()
    
    private lazy var corpusData = {
        NSDataAsset(name: "corpus", bundle: .module)!.data
    }()
    
    private lazy var rootTitles: com_quranic_wholequran_fbs_SurahTitles = {
        com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(bb: ByteBuffer(data: surahTitleData))
    }()
    
    private lazy var rootCorpus: com_quranic_wholequran_fbs_Corpus = {
        com_quranic_wholequran_fbs_Corpus.getRootAsCorpus(bb: ByteBuffer(data: surahTitleData))
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitle_1() throws {
        let rootTitles =
            com_quranic_wholequran_fbs_SurahTitles
            .getRootAsSurahTitles(bb: ByteBuffer(data: surahTitleData))
        let title_1: SurahTitleModel = SurahTitleModelFlatBuffers(
            root: rootTitles,
            no: 1,
            locale: "en",
            defaultLocale: "en")
        
        assert(title_1: title_1)
    }
    
    func testTitles() throws {
        let titles = SurahTitlesModelFlatBuffers(data: surahTitleData, locale: "en", defaultLocale: "en")
        assert(titles: titles)
    }
    
    func testSurah_1() throws {
        let title_1: SurahTitleModel =
            SurahTitleModelFlatBuffers(root: rootTitles,
                                       no: 1,
                                       locale: "en",
                                       defaultLocale: "en")
        let surah_1 = SurahModelFlatBuffers(bundle: bundle, assetNo: 1, title: title_1)
        assert(surah_1: surah_1)
    }
    
    func testCorpus() throws {
        let corpus = CorpusModelFlatBuffers(data: corpusData)
        assert(corpus: corpus)
    }
    
    func testWholeQuran() throws {
        let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")
        
        assert(titles: wholeQuran.surahTitles)
        assert(surahs: wholeQuran.surahs)
        assert(ayah_1_1: wholeQuran.surahs[1].ayahs[1])
        assert(surahsPivot: wholeQuran.surahsPivot, withSurahs: wholeQuran.surahs)
        assert(corpus: wholeQuran.corpus)
        
        // let corpusEntry_1_1_1 = wholeQuran.co
    }
    
    func testLemsSearch() {
        let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")
        assertAsSearch(corpus: wholeQuran.corpus, corpusPivot: wholeQuran.corpusPivot)
    }
    
    func testCorpus_21_109_4() {
        let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")
        let corpus = wholeQuran.corpus
        
        let position = "21:109:4:1"
        let indexes = position.split(separator: ":")
        let entryIndex = indexes[0] + ":" + indexes[1] + ":" + indexes[2]
        
        if let ce = corpus.by(key: entryIndex) {
            let part = ce.parts[Int(indexes[3])!]
            let lem = part.lem
            XCTAssertNotNil(lem)
        }
    }
    
    func testWBW() {
        // create API endpoint
        let wholeQuran = WholeQuranFlatBuffers(locale: "en", defaultLocale: "en")
        // get WBW API
        let wbw = wholeQuran.wbw
        
        // wbw is divided by 114 surahs
        XCTAssertEqual(114, wbw.count)
        
        // get 1st surah
        let surah1 = wbw[1]
        // make sure it has 29 entries
        XCTAssertEqual(29, surah1.count)
        
        // access (word) entry of 1st surah by position
        let w0 = surah1[0]
        XCTAssertEqual("1:1:1", w0.id)
        XCTAssertEqual("In (the) name", w0.meaning)
        XCTAssertEqual("bis'mi", w0.transliteration)
        
        // access (word) entry of 1st surah by index string
        //   - non existing index returns 0
        XCTAssertNil(surah1.by(key: "non existing"))
        XCTAssertNil(surah1.by(key: "0:0:0"))
        XCTAssertNil(surah1.by(key: "1000:0:0"))
        XCTAssertNil(surah1.by(key: "0:1000:0"))
        XCTAssertNil(surah1.by(key: "0:0:1000"))
        
        //   - existing index returns an entry
        let s1_1_1 = surah1.by(key: "1:1:1")
        XCTAssertNotNil(s1_1_1)
        XCTAssertEqual("1:1:1", s1_1_1!.id)
        XCTAssertEqual("In (the) name", s1_1_1!.meaning)
        XCTAssertEqual("bis'mi", s1_1_1!.transliteration)
        
        // the same for surah2
        let surah2 = wbw[2]
        XCTAssertEqual(6116, surah2.count)
        
        let w1000 = surah2[1000]
        XCTAssertEqual("2:66:3", w1000.id)
        XCTAssertEqual("for those", w1000.meaning)
        XCTAssertEqual("limā", w1000.transliteration)
        
        let s2_66_3 = surah2.by(key: "2:66:3")
        XCTAssertNotNil(s2_66_3)
        XCTAssertEqual("2:66:3", s2_66_3!.id)
        XCTAssertEqual("for those", w1000.meaning)
        XCTAssertEqual("limā", w1000.transliteration)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
        }
    }
    
    static var allTests = [
        ("testTitle_1", testTitle_1),
        ("testTitles", testTitles),
        ("testSurah_1", testSurah_1),
    ]
}
