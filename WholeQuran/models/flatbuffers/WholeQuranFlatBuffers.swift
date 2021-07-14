//
//  WholeQuranFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

class FooForBundle {
    // TODO: ugly
}
struct WholeQuranFlatBuffers: WholeQuranModel {
    let surahTitles: SurahTitlesModelFlatBuffers
    let surahs: SurahsModelFlatBuffers
    let surahsPivot: SurahsPivotModelFlatBuffers
    let corpus: CorpusModelFlatBuffers
    let corpusPivot: CorpusPivotModelFlatBuffers

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
    }

    init(locale: String, defaultLocale: String) {
        self.init(
            bundle: Bundle(for: FooForBundle.self),
            locale: locale,
            defaultLocale: defaultLocale
        )
    }
}
