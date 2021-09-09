//
//  WBWModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//

import Foundation

struct WBWModelFlatBuffers: WBWModel {
    typealias SurahModel = WBWSurahModelFlatBuffers

    private static var cache: [Int: SurahModel] = [:]
    private let bundle: Bundle
    
    subscript(position: Int) -> SurahModel {
        if let cached = WBWModelFlatBuffers.cache[position] {
            return cached
        } else {
            let cached = WBWSurahModelFlatBuffers(bundle: bundle, assetNo: position)
            WBWModelFlatBuffers.cache[position] = cached
            return cached
        }
    }
    
    init(bundle theBundle: Bundle) {
        bundle = theBundle
    }
    
}
