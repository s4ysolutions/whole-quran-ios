//
//  WBWModelFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//

import Foundation
import UIKit
import FlatBuffers

struct WBWSurahModelProvider: FlatBuffersCollecitonProvider {
    typealias FlatBuffersType = com_quranic_wholequran_fbs_SurahWBW
    typealias ModelType = WBWEntryModelFlatBuffers

    let root: FlatBuffersType

    @inlinable
    @inline(__always)
    subscript(position: Int32) -> WBWEntryModelFlatBuffers {
        return WBWEntryModelFlatBuffers(root: root.wbw(at: position)!)
    }

    @inlinable
    @inline(__always)
    var count: Int32 {
        return root.wbwCount
    }
}

struct WBWSurahModelFlatBuffers: WBWSurahModel, CollectionZeroBasedFlatBuffersProvided {
    typealias ProviderType = WBWSurahModelProvider
    let provider: ProviderType
    let surahNo: Int
/*
    func by(key: String) -> WBWEntryModelFlatBuffers? {
        guard let root = provider.root.wbwBy(key: key) else {
            return nil
        }
        return WBWEntryModelFlatBuffers(root: root)
    }
*/
    func by(surah: Int, ayah: Int, word: Int) -> Self.Element? {
        let keyi = ((surah * 300 + ayah) * 145) + word
        guard keyi != 0 else {
            return nil
        }
        /*
        guard let fb = provider.root.wbwBy(key: UInt64(keyi)) else {
            return nil
        }

        return WBWEntryModelFlatBuffers(root: fb)
*/

        var lowerIndex = startIndex
        var upperIndex = endIndex - 1

        while true {
            let currentIndex = (lowerIndex + upperIndex) / 2
            if self[currentIndex].key == keyi {
                return self[currentIndex]
            } else if lowerIndex > upperIndex {
                return nil
            } else {
                if self[currentIndex].key > keyi {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }

    func by(ayah: Int, word: Int) -> Self.Element? {
        return by(surah: surahNo, ayah: ayah, word: word)
    }

    func by(key: String) -> Self.Element? {
        let keya = key.components(separatedBy: ":")
        guard keya.count == 3 else {
            return nil
        }
        return by(surah: Int(keya[0]) ?? 0, ayah: Int(keya[1]) ?? 0, word: Int(keya[2]) ?? 0)
    }

    @inlinable
    @inline(__always)
    init(bundle: Bundle, assetNo: Int) {
        self.init(surah: assetNo, bundle: bundle, assetName: "surah_wbw_\(assetNo)")
    }

    @inlinable
    @inline(__always)
    init(surah theSurah: Int, bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(surah: theSurah, data: data)
    }

    @inlinable
    @inline(__always)
    init(surah theSurahNo: Int, data: Data) {
        let root = com_quranic_wholequran_fbs_SurahWBW.getRootAsSurahWBW(bb: ByteBuffer(data: data))
        provider = WBWSurahModelProvider(root: root)
        surahNo = theSurahNo
    }
}
