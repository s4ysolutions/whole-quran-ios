//
//  FlatBuffersTitlesTest.swift
//  WholeQuranTests
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import XCTest
import FlatBuffers
@testable import WholeQuran

class FlatBuffersTitlesTest: XCTestCase {
    private let allah = "ٱللَّهِ"
    private lazy var surahTitleData = {
        return FlatBuffersData.get(dataAsset: "surah_titles")
    }()
    
    private lazy var rootTitles: com_quranic_wholequran_fbs_SurahTitles = {
        return com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(bb: ByteBuffer(data: surahTitleData))
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitle_1() throws {
        let rootTitles = com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(bb: ByteBuffer(data: surahTitleData))
        let title_1: SurahTitleModel = SurahTitleModelFlatBuffers(titles: rootTitles, no: 1, locale: "en", defaultLocale: "en")
        XCTAssertEqual(title_1.no, 1)
        XCTAssertEqual(title_1.arabic, "الفاتحة")
        XCTAssertEqual(title_1.localize, "The Opening")
        XCTAssertEqual(title_1.translit, "Al-Fatihah")
    }

    func testTitles() throws {
        let titles  = SurahTitlesModelFlatBuffers(data: surahTitleData, locale: "fr", defaultLocale: "en")
       // let arabicTitles = titles.arabic()
        XCTAssertEqual(titles.count, 114)
        let title_1 = titles[1]
        XCTAssertEqual(title_1.no, 1)
        XCTAssertEqual(title_1.arabic, "الفاتحة")
        XCTAssertEqual(title_1.localize, "L'ouverture ")
        XCTAssertEqual(title_1.translit, "Al-Fatihah")
        var n: Int = 1
        for title in titles {
            XCTAssertEqual(n, title.no)
            n+=1
        }
        XCTAssertEqual(titles.count, n - 1)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSurah_1() throws {
        let title_1: SurahTitleModel = SurahTitleModelFlatBuffers(titles: rootTitles, no: 1, locale: "en", defaultLocale: "en")
        let surah_1 = SurahModelFlatBuffers(assetNo: 1, title: title_1)
        XCTAssertEqual(surah_1.ayahs[1].arabic[2], allah)
    }
    
    static var allTests = [
        ("testTitle_1", testTitle_1),
        ("testTitles", testTitles),
        ("testSurah_1", testSurah_1),
    ]

}
