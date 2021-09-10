//
//  WholeQuranFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

public struct WholeQuranFlatBuffers: WholeQuranModel {
    public let surahTitles: SurahTitlesModelFlatBuffers
    public let surahs: SurahsModelFlatBuffers
    public let surahsPivot: SurahsPivotModelFlatBuffers
    public let corpus: CorpusModelFlatBuffers
    public let corpusPivot: CorpusPivotModelFlatBuffers
    public let wbw: WBWModelFlatBuffers

    init(bundle: Bundle, locale: String, defaultLocale: String) {
        surahTitles = SurahTitlesModelFlatBuffers(
            bundle: bundle,
            locale: locale,
            defaultLocale: defaultLocale)
        surahs = SurahsModelFlatBuffers(
           bundle: bundle,
           titles: surahTitles
       )
        surahsPivot = SurahsPivotModelFlatBuffers(bundle: bundle)
        corpus = CorpusModelFlatBuffers(bundle: bundle)
        corpusPivot = CorpusPivotModelFlatBuffers(bundle: bundle)
        wbw = WBWModelFlatBuffers(bundle: bundle)
    }

    public init(locale: String = "en", defaultLocale: String = "en") {
        self.init(
            bundle: .module,
            locale: locale,
            defaultLocale: defaultLocale
        )
    }
}
