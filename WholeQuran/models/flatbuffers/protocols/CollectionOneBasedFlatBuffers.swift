//
//  CollectionOneBasedFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 10.07.2021.
//

import Foundation

protocol CollectionOneBasedFlatBuffersProvided: CollectionOneBased, CollectionFlatBuffers {
}

extension CollectionOneBasedFlatBuffersProvided {
    @inlinable
    @inline(__always)
    subscript(position: Self.Index) -> Self.ProviderType.ModelType {
        return provider[Int32(position - 1)]
    }

    @inlinable
    @inline(__always)
    var endIndex: Int {
        return Int(provider.count + 1)
    }
}

struct CollectionOneBasedFlatBuffers<Provider: FlatBuffersCollecitonProvider>: CollectionOneBasedFlatBuffersProvided {
    let provider: Provider
}
