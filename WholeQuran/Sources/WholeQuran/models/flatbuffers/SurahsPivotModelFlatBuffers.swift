//
//  SurahsPivotModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 08.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

struct SurahsPivotModelProvider: FlatBuffersCollecitonProvider {
    typealias FlatBuffersType = com_quranic_wholequran_fbs_SurahsPivot
    typealias ModelType = SurahsPivotWordEntryModelFlatBuffers

    let root: FlatBuffersType

    @inlinable
    @inline(__always)
    subscript(position: Int32) -> SurahsPivotWordEntryModelFlatBuffers {
        return SurahsPivotWordEntryModelFlatBuffers(root: root.entries(at: position)!)
    }

    @inlinable
    @inline(__always)
    var count: Int32 {
        return root.entriesCount
    }
}

public struct SurahsPivotModelFlatBuffers: SurahsPivotModel, CollectionSearchableByKeyFromFlatBuffers {
    typealias ProviderType = SurahsPivotModelProvider

    let provider: SurahsPivotModelProvider

    @inline(__always)
    init(bundle theBundle: Bundle) {
        self.init(bundle: theBundle, assetName: "surahs_pivot")
    }

    @inline(__always)
    init(bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(data: data)
    }

    @inline(__always)
    public init(data: Data) {
        let root = com_quranic_wholequran_fbs_SurahsPivot.getRootAsSurahsPivot(bb: ByteBuffer(data: data))
        provider = SurahsPivotModelProvider(root: root)
    }
}
