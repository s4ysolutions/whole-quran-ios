//
//  CorpusModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 10.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

struct CorpusWordEntryProvider: FlatBuffersCollecitonProvider {
    typealias FlatBuffersType = com_quranic_wholequran_fbs_Corpus
    typealias ModelType = CorpusWordEntryModelFlatBuffers

    let root: FlatBuffersType

    @inlinable
    @inline(__always)
    subscript(position: Int32) -> ModelType {
        return ModelType(root: root.words(at: position)!)
    }

    @inlinable
    @inline(__always)
    var count: Int32 {
        return root.wordsCount
    }

    @inlinable
    @inline(__always)
    init(data: Data) {
        root = FlatBuffersType.getRootAsCorpus(bb: ByteBuffer(data: data))
    }
}

struct CorpusModelFlatBuffers: CorpusModel, CollectionSearchableByKeyFromFlatBuffers {
    internal let provider: CorpusWordEntryProvider

    @inlinable
    @inline(__always)
    init(bundle theBundle: Bundle) {
        self.init(bundle: theBundle, assetName: "corpus")
    }

    @inlinable
    @inline(__always)
    init(bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(data: data)
    }

    @inlinable
    @inline(__always)
    init(data: Data) {
        provider = CorpusWordEntryProvider(data: data)
    }
}
