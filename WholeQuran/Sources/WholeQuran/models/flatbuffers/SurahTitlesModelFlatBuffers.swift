//
//  SurahTitleCollectionFlatbuffer.swift
//  whole-quran-demo
//
//  Created by  Sergey Dolin on 05.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

public struct SurahTitlesFlatBuffersProvider: FlatBuffersCollecitonProvider, Localizable {
    public typealias FlatBuffersType = com_quranic_wholequran_fbs_SurahTitles
    public typealias ModelType = SurahTitleModelFlatBuffers

    public let root: FlatBuffersType
    public let count = Int32(114)
    internal let locale: String
    internal let defaultLocale: String

    @inline(__always)
    public subscript(position: Int32) -> ModelType {
        return SurahTitleModelFlatBuffers(
            root: root,
            index: position,
            locale: locale,
            defaultLocale: defaultLocale
        )
    }
}

public struct SurahTitlesModelFlatBuffers: SurahTitlesModel, CollectionOneBasedFlatBuffersProvided {
    public let provider: SurahTitlesFlatBuffersProvider
    public let locale: String
    public let defaultLocale: String

    @inline(__always)
    init(bundle: Bundle, locale: String, defaultLocale: String) {
        self.init(
            root: com_quranic_wholequran_fbs_SurahTitles.getRootAsSurahTitles(
                bb: ByteBuffer(data: NSDataAsset(name: "surah_titles", bundle: bundle)!.data)),
            locale: locale,
            defaultLocale: defaultLocale)
    }

    @inline(__always)
    init(data: Data, locale: String, defaultLocale: String) {
        self.init(
            root: com_quranic_wholequran_fbs_SurahTitles
                .getRootAsSurahTitles(bb: ByteBuffer(data: data)),
            locale: locale,
            defaultLocale: defaultLocale
        )
    }

    @inline(__always)
    init(root: com_quranic_wholequran_fbs_SurahTitles, locale: String, defaultLocale: String) {
        self.init(
            provider: SurahTitlesFlatBuffersProvider(
                root: root,
                locale: locale,
                defaultLocale: defaultLocale),
            locale: locale,
            defaultLocale: defaultLocale)
    }

    @inline(__always)
    init(provider theProvider: SurahTitlesFlatBuffersProvider,
         locale theLocale: String,
         defaultLocale theDefaultLocale: String) {
        provider = theProvider
        locale = theLocale
        defaultLocale = theDefaultLocale
    }
}
