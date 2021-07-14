//
//  CorpusPivotEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 08.07.2021.
//

import Foundation

struct CorpusPivotEntryModelFlatBuffers: CorpusPivotEntryModel, HavingItemKey {
    let root: com_quranic_wholequran_fbs_CorpusPivotEntry

    @inlinable
    @inline(__always)
    var id: String {
        return root.id
    }

    @inlinable
    @inline(__always)
    var key: String {
        return id
    }

    struct CorpusPivotEntryPositionProvider: FlatBuffersCollecitonProvider {
        typealias FlatBuffersType = com_quranic_wholequran_fbs_CorpusPivotEntry
        typealias ModelType = CorpusPivotEntryPosModelFlatBuffers

        let root: FlatBuffersType

        @inlinable
        @inline(__always)
        subscript(position: Int32) -> ModelType {
            return CorpusPivotEntryPosModelFlatBuffers(root: root.locations(at: position)!)
        }

        @inlinable
        @inline(__always)
        var count: Int32 {
            return root.locationsCount
        }
    }

    typealias CorpusPivotEntryPositionsFlatBuffers =
        CollectionZeroBasedFlatBuffers<CorpusPivotEntryPositionProvider>

    @inlinable
    @inline(__always)
    var positions: CorpusPivotEntryPositionsFlatBuffers {
        let provider = CorpusPivotEntryPositionProvider(root: root)
        return CorpusPivotEntryPositionsFlatBuffers(provider: provider)
    }
}
