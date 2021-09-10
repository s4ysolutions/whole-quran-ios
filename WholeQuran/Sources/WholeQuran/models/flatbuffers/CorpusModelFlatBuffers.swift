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
    public typealias ModelType = CorpusWordEntryModelFlatBuffers

    let root: FlatBuffersType

    @inline(__always)
    subscript(position: Int32) -> ModelType {
        return ModelType(root: root.words(at: position)!)
    }

    @inline(__always)
    var count: Int32 {
        return root.wordsCount
    }

    @inline(__always)
    init(data: Data) {
        root = FlatBuffersType.getRootAsCorpus(bb: ByteBuffer(data: data))
    }
}

public struct CorpusModelFlatBuffers: CorpusModel, CollectionSearchableByKeyFromFlatBuffers {
    internal let provider: CorpusWordEntryProvider

    @inline(__always)
    init(bundle theBundle: Bundle) {
        self.init(bundle: theBundle, assetName: "corpus")
    }

    @inline(__always)
    init(bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(data: data)
    }

    @inline(__always)
    public init(data: Data) {
        provider = CorpusWordEntryProvider(data: data)
    }
}
