//
//  CorpusPivotModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import FlatBuffers
import Foundation
import UIKit

public struct CorpusPivotModelFlatBuffers: CorpusPivotModel {
    let root: com_quranic_wholequran_fbs_CorpusPivot

    struct CorpusPivotEntriesFlatBuffers: CollectionSearchableByKey, CollectionZeroBased {
        let endIndex: Int

        fileprivate let getItem: (_ position: Int) -> CorpusPivotEntryModelFlatBuffers

//        @inlinable
        @inline(__always)
        subscript(position: Int) -> CorpusPivotEntryModelFlatBuffers {
            return getItem(position)
        }
    }

//    @inlinable
    @inline(__always)
    var exact: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.exactCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.exact(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    var lem: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.lemCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.lem(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    var lemc: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.lemcCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.lemc(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    var form: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.formCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.form(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    var formc: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.formcCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.formc(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    var consonant: CorpusPivotEntriesFlatBuffers {
        return CorpusPivotEntriesFlatBuffers(
            endIndex: Int(root.consonantCount),
            getItem: { position in
                CorpusPivotEntryModelFlatBuffers(root: root.consonant(at: Int32(position))!)
            })
    }

//    @inlinable
    @inline(__always)
    init(bundle theBundle: Bundle) {
        self.init(bundle: theBundle, assetName: "corpus_pivot")
    }

//    @inlinable
    @inline(__always)
    init(bundle theBundle: Bundle, assetName: String) {
        let data = NSDataAsset(name: assetName, bundle: theBundle)!.data
        self.init(data: data)
    }

//    @inlinable
    @inline(__always)
    init(data: Data) {
        root = com_quranic_wholequran_fbs_CorpusPivot.getRootAsCorpusPivot(bb: ByteBuffer(data: data))
    }
}
