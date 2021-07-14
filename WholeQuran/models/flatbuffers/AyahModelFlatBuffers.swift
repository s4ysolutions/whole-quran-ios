//
//  AyahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

struct AyahModelFlatBuffers: AyahModel {
    let root: com_quranic_wholequran_fbs_Ayah

    @inlinable
    @inline(__always)
    var no: Int {
        return Int(root.no)
    }

    struct AyahWordModelFlatBuffers: AyahWordModel {
        let no: Int
        let word: String
    }

    struct AyahWordsProvider: FlatBuffersCollecitonProvider {
        typealias FlatBuffersType = com_quranic_wholequran_fbs_Ayah
        typealias ModelType = AyahWordModel

        let root: FlatBuffersType

        @inlinable
        @inline(__always)
        subscript(position: Int32) -> ModelType {
            return AyahWordModelFlatBuffers(no: Int(position + 1), word: root.words(at: position)!)
        }

        @inlinable
        @inline(__always)
        var count: Int32 { return root.wordsCount }
    }

    typealias AyahWordsFlatBuffers = CollectionOneBasedFlatBuffers<AyahWordsProvider>
    @inlinable
    @inline(__always)
    var arabic: AyahWordsFlatBuffers {
        let provider = AyahWordsProvider(root: root)
        return AyahWordsFlatBuffers(provider: provider)
    }
}
