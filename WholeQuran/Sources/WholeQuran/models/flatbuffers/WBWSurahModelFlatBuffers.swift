//
//  WBWModelFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//
import Foundation
import UIKit
import FlatBuffers

public struct WBWSurahModelProvider: FlatBuffersCollecitonProvider {
    public typealias FlatBuffersType = com_quranic_wholequran_fbs_SurahWBW
    public typealias ModelType = WBWEntryModelFlatBuffers

    public let root: FlatBuffersType

    public subscript(position: Int32) -> WBWEntryModelFlatBuffers {
        return WBWEntryModelFlatBuffers(root: root.wbw(at: position)!)
    }

    public var count: Int32 {
        return root.wbwCount
    }
}

public struct WBWSurahModelFlatBuffers: WBWSurahModel, CollectionZeroBasedFlatBuffersProvided {
    public typealias ProviderType = WBWSurahModelProvider
    let provider: ProviderType
/*
    func by(key: String) -> WBWEntryModelFlatBuffers? {
        guard let root = provider.root.wbwBy(key: key) else {
            return nil
        }
        return WBWEntryModelFlatBuffers(root: root)
    }
*/
    public func by(key: String) -> Self.Element? {
        let keya = key.components(separatedBy: ":")
        guard keya.count == 3 else {
            return nil
        }
        let keyi_1 = (((Int(keya[0]) ?? 0) * 300 + (Int(keya[1]) ?? 0)) * 145)
        let keyi = keyi_1 + (Int(keya[2]) ?? 0)
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

    init(bundle: Bundle, assetNo: Int) {
        self.init(bundle: bundle, assetName: "surah_wbw_\(assetNo)")
    }

    init(bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(data: data)
    }

    init(data: Data) {
        let root = com_quranic_wholequran_fbs_SurahWBW.getRootAsSurahWBW(bb: ByteBuffer(data: data))
        provider = WBWSurahModelProvider(root: root)
    }
}
