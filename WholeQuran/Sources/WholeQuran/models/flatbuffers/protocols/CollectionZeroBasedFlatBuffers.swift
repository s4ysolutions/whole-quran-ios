//
//  CollectionFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 10.07.2021.
//

import Foundation

protocol CollectionZeroBasedFlatBuffersProvided: CollectionZeroBased, CollectionFlatBuffers {
}

extension CollectionZeroBasedFlatBuffersProvided {
    @inlinable
    @inline(__always)
    public subscript(position: Self.Index) -> Self.ProviderType.ModelType {
        return provider[Int32(position)]
    }

    @inlinable
    @inline(__always)
    public var endIndex: Int {
        return Int(provider.count)
    }
}

struct CollectionZeroBasedFlatBuffers<Provider: FlatBuffersCollecitonProvider>: CollectionZeroBasedFlatBuffersProvided {
    let provider: Provider
}
