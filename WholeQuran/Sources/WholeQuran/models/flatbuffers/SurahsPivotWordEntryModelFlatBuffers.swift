//
//  SurahsPivotWordEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 08.07.2021.
//

import Foundation

struct SurahsPivotWordEntryModelFlatBuffers: SurahsPivotWordEntryModel, HavingItemKey {
    let root: com_quranic_wholequran_fbs_SurahsPivotWordEntry

    @inlinable
    @inline(__always)
    var word: String {
        return root.word
    }

    @inlinable
    @inline(__always)
    var key: String {
        root.word
    }

    struct SurahsPivotWordPosesProvider: FlatBuffersCollecitonProvider {
        typealias FlatBuffersType = com_quranic_wholequran_fbs_SurahsPivotWordEntry
        typealias ModelType = SurahsPivotWordPosModelFlatBuffers

        let root: FlatBuffersType
        @inlinable
        @inline(__always)
        subscript(position: Int32) -> ModelType {
            return ModelType(root: root.positions(at: position)!)
        }

        @inlinable
        @inline(__always)
        var count: Int32 {
            return root.positionsCount
        }
    }

    typealias SurahsPivotWordPosesFlatBuffers = CollectionZeroBasedFlatBuffers<SurahsPivotWordPosesProvider>
    @inlinable
    @inline(__always)
    var positions: SurahsPivotWordPosesFlatBuffers {
        let provider = SurahsPivotWordPosesProvider(root: root)
        return SurahsPivotWordPosesFlatBuffers(provider: provider)
    }
}
