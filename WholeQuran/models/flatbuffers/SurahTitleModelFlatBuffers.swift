//
//  SurahTitleFlatbuffer.swift
//  whole-quran-demo
//
//  Created by  Sergey Dolin on 05.07.2021.
//

import Foundation

struct SurahTitleModelFlatBuffers: SurahTitleModel {
    private let titles: com_quranic_wholequran_fbs_SurahTitles
    let no: Int
    private let locale: String
    private let defaultLocale: String

    private let index: Int

    var arabic: String {
        get {
            return titles.surahTitlesBy(key: "ar")?.titles(at: Int32(index))?.title ?? ""
        }
    }
    
    var translit: String {
        get {
            return titles.surahTitlesBy(key: "translit")?.titles(at: Int32(index))?.title ?? ""
        }
    }
    
    var localize: String {
        get {
            return (titles.surahTitlesBy(key: locale) ?? titles.surahTitlesBy(key: defaultLocale))?.titles(at: Int32(index))?.title ?? ""
        }
    }
    
    init(titles theTitles: com_quranic_wholequran_fbs_SurahTitles,no theNo: Int,locale theLocale: String,defaultLocale theDefaultLocale: String){
        titles = theTitles
        no = theNo
        index = no - 1
        locale = theLocale
        defaultLocale = theDefaultLocale
    }
}
