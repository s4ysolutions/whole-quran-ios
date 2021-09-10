//
//  SurahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

public struct SurahModelFlatBuffers: SurahModel {
    let root: com_quranic_wholequran_fbs_Surah
    public let title: SurahTitleModel

    @inline(__always)
    public var no: Int {
        Int(root.no)
    }

    public struct AyahsProvider: FlatBuffersCollecitonProvider {
        public typealias FlatBuffersType = com_quranic_wholequran_fbs_Surah
        public typealias ModelType = AyahModelFlatBuffers

        public let root: FlatBuffersType

        @inline(__always)
        public subscript(position: Int32) -> ModelType {
            return AyahModelFlatBuffers(root: root.ayahs(at: position)!)
        }

        @inline(__always)
        public var count: Int32 { return root.ayahsCount }
    }

    public typealias AyahsFlatBuffers = CollectionOneBasedFlatBuffers<AyahsProvider>

    @inline(__always)
    public var ayahs: AyahsFlatBuffers {
        let provider = AyahsProvider(root: root)
        return AyahsFlatBuffers(provider: provider)
    }

    @inline(__always)
    init(bundle: Bundle, assetNo: Int, title theTitle: SurahTitleModel) {
        self.init(bundle: bundle, assetName: "surah_\(assetNo)", title: theTitle)
    }

    @inline(__always)
    init(bundle: Bundle, assetName: String, title theTitle: SurahTitleModel) {
        let data = NSDataAsset(name: assetName, bundle: .module)!.data
        self.init(data: data, title: theTitle)
    }

    @inline(__always)
    init(data: Data, title theTitle: SurahTitleModel) {
        let root = com_quranic_wholequran_fbs_Surah.getRootAsSurah(bb: ByteBuffer(data: data))
        self.init(root: root, title: theTitle)
    }

    @inline(__always)
    init(root theRoot: com_quranic_wholequran_fbs_Surah, title theTitle: SurahTitleModel) {
        root = theRoot
        title = theTitle
    }
}
