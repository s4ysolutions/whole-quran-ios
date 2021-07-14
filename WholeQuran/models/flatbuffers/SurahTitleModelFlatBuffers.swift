//
//  SurahTitleFlatbuffer.swift
//  whole-quran-demo
//
//  Created by  Sergey Dolin on 05.07.2021.
//

import Foundation

struct SurahTitleModelFlatBuffers: SurahTitleModel, Localizable {
    let root: com_quranic_wholequran_fbs_SurahTitles
    private let index: Int32

    let no: Int
    internal let locale: String
    internal let defaultLocale: String

    @inlinable
    @inline(__always)
    var arabic: String {
        return root.surahTitlesBy(key: "ar")?.titles(at: index)?.title ?? ""
    }

    @inlinable
    @inline(__always)
    var translit: String {
        return (root.surahTitlesBy(key: "translit")?.titles(at: index)?.title!)!
    }

    @inlinable
    @inline(__always)
    var localize: String {
        return (
            root.surahTitlesBy(key: locale)
                ??
                root.surahTitlesBy(key: defaultLocale)
        )?.titles(at: index)?.title ?? ""
    }

    @inlinable
    @inline(__always)
    init(root theRoot: com_quranic_wholequran_fbs_SurahTitles,
         no theNo: Int,
         locale theLocale: String,
         defaultLocale theDefaultLocale: String) {
        root = theRoot
        no = theNo
        index = Int32(no - 1)
        locale = theLocale
        defaultLocale = theDefaultLocale
    }

    @inlinable
    @inline(__always)
    init(root theRoot: com_quranic_wholequran_fbs_SurahTitles,
         index theIndex: Int32,
         locale theLocale: String,
         defaultLocale theDefaultLocale: String) {
        root = theRoot
        no = Int(theIndex) + 1
        index = theIndex
        locale = theLocale
        defaultLocale = theDefaultLocale
    }
}
