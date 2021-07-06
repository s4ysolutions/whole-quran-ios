
//
//  SurahTitleCollectionFlatbuffer.swift
//  whole-quran-demo
//
//  Created by  Sergey Dolin on 05.07.2021.
//

import Foundation
import FlatBuffers
import UIKit

struct SurahTitlesModelFlatBuffers: SurahTitlesModel {
    private let titles: com_quranic_wholequran_fbs_SurahTitles
    private let locale: String
    private let defaultLocale: String
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    subscript(position: Int) -> SurahTitleModel {
        get {
            return SurahTitleModelFlatBuffers(titles: titles, no: position, locale: locale, defaultLocale: defaultLocale)
        }
    }
    
    var startIndex: Int = 1
    
    var endIndex: Int
    
    init(locale theLocale: String,defaultLocale theDefaultLocale: String){
        self.init(titles: com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(bb: ByteBuffer(data: FlatBuffersData.get(dataAsset: "surah_titles"))), locale: theLocale, defaultLocale: theDefaultLocale)
    }
    
    init(data: Data, locale theLocale: String,defaultLocale theDefaultLocale: String){
        self.init(titles: com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(bb: ByteBuffer(data: data)), locale: theLocale, defaultLocale: theDefaultLocale)
    }
    
    init(titles theTitles: com_quranic_wholequran_fbs_SurahTitles, locale theLocale: String,defaultLocale theDefaultLocale: String){
        titles = theTitles
        locale = theLocale
        defaultLocale = theDefaultLocale
        endIndex = Int((titles.surahTitlesBy(key: "ar")?.titlesCount ?? Int32(0))) + 1
    }
    

}
