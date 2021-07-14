//
//  SurahsModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

struct SurahsModelFlatBuffers: SurahsModel {
    typealias SurahModel = SurahModelFlatBuffers

    private let titles: SurahTitlesModelFlatBuffers
    private static var cache: [Int: SurahModel] = [:]

    private let bundle: Bundle

    subscript(position: Int) -> SurahModelFlatBuffers {
        if let cached = SurahsModelFlatBuffers.cache[position] {
            return cached
        } else {
            let cached = SurahModelFlatBuffers(bundle: bundle, assetNo: position, title: titles[position])
            SurahsModelFlatBuffers.cache[position] = cached
            return cached
        }
    }

    @inlinable
    @inline(__always)
    init(bundle theBundle: Bundle, titles theTitles: SurahTitlesModelFlatBuffers) {
        bundle = theBundle
        titles = theTitles
    }
}
