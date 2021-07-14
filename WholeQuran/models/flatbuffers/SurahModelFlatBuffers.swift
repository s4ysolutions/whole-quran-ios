//
//  SurahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

struct SurahModelFlatBuffers: SurahModel {
    let root: com_quranic_wholequran_fbs_Surah
    let title: SurahTitleModel

    @inlinable
    @inline(__always)
    var no: Int {
        Int(root.no)
    }

    struct AyhsProvider: FlatBuffersCollecitonProvider {
        typealias FlatBuffersType = com_quranic_wholequran_fbs_Surah
        typealias ModelType = AyahModelFlatBuffers

        let root: FlatBuffersType

        @inlinable
        @inline(__always)
        subscript(position: Int32) -> ModelType {
            return AyahModelFlatBuffers(root: root.ayahs(at: position)!)
        }

        @inlinable
        @inline(__always)
        var count: Int32 { return root.ayahsCount }
    }

    typealias AyahsFlatBuffers = CollectionOneBasedFlatBuffers<AyhsProvider>

    @inlinable
    @inline(__always)
    var ayahs: AyahsFlatBuffers {
        let provider = AyhsProvider(root: root)
        return AyahsFlatBuffers(provider: provider)
    }

    @inlinable
    @inline(__always)
    init(bundle: Bundle, assetNo: Int, title theTitle: SurahTitleModel) {
        self.init(bundle: bundle, assetName: "surah_\(assetNo)", title: theTitle)
    }

    @inlinable
    @inline(__always)
    init(bundle: Bundle, assetName: String, title theTitle: SurahTitleModel) {
        let data = NSDataAsset(name: assetName, bundle: bundle)!.data
        self.init(data: data, title: theTitle)
    }

    @inlinable
    @inline(__always)
    init(data: Data, title theTitle: SurahTitleModel) {
        let root = com_quranic_wholequran_fbs_Surah.getRootAsSurah(bb: ByteBuffer(data: data))
        self.init(root: root, title: theTitle)
    }

    @inlinable
    @inline(__always)
    init(root theRoot: com_quranic_wholequran_fbs_Surah, title theTitle: SurahTitleModel) {
        root = theRoot
        title = theTitle
    }
}
