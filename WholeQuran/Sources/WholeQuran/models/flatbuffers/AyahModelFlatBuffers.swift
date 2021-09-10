//
//  AyahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

public struct AyahModelFlatBuffers: AyahModel {
    let root: com_quranic_wholequran_fbs_Ayah

    @inline(__always)
    public var no: Int {
        return Int(root.no)
    }

    struct AyahWordModelFlatBuffers: AyahWordModel {
        let no: Int
        let word: String
    }

    public struct AyahWordsProvider: FlatBuffersCollecitonProvider {
        public typealias FlatBuffersType = com_quranic_wholequran_fbs_Ayah
        public typealias ModelType = AyahWordModel

        public let root: FlatBuffersType

        @inline(__always)
        public subscript(position: Int32) -> ModelType {
            return AyahWordModelFlatBuffers(no: Int(position + 1), word: root.words(at: position)!)
        }

        @inline(__always)
        public var count: Int32 { return root.wordsCount }
    }

    public typealias AyahWordsFlatBuffers = CollectionOneBasedFlatBuffers<AyahWordsProvider>

    @inline(__always)
    public var arabic: AyahWordsFlatBuffers {
        let provider = AyahWordsProvider(root: root)
        return AyahWordsFlatBuffers(provider: provider)
    }
}
