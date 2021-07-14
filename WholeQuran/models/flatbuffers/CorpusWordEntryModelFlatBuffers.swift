//
//  CorpusWordEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 08.07.2021.
//

import Foundation

struct CorpusWordEntryModelFlatBuffers: CorpusWordEntryModel, HavingItemKey {
    let root: com_quranic_wholequran_fbs_CorpusWordEntry

    struct CorpusWordPartEntries: CollectionOneBased {
        let root: com_quranic_wholequran_fbs_CorpusWordEntry

        @inlinable
        @inline(__always)
        subscript(position: Int) -> CorpusPartEntryModelFlatBuffers {
            return CorpusPartEntryModelFlatBuffers(root: root.parts(at: Int32(position - 1))!)
        }

        @inlinable
        @inline(__always)
        var endIndex: Int {
            return Int(root.partsCount) + 1
        }

        @inlinable
        @inline(__always)
        init(root theRoot: com_quranic_wholequran_fbs_CorpusWordEntry) {
            root = theRoot
        }
    }

    @inlinable
    @inline(__always)
    var index: String {
        return root.index
    }

    @inlinable
    @inline(__always)
    var parts: CorpusWordPartEntries {
        return CorpusWordPartEntries(root: root)
    }

    @inlinable
    @inline(__always)
    var key: String {
        return index
    }
}
