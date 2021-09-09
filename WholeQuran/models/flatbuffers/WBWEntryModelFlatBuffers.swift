//
//  WBWEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//

import Foundation

struct WBWEntryModelFlatBuffers: WBWEntryModel, HavingItemKey {

    let root: com_quranic_wholequran_fbs_WordByWordEntry

    @inlinable
    @inline(__always)
    var id: String {
        return root.id!
    }

    @inlinable
    @inline(__always)
    var meaning: String {
        return root.meaning!
    }

    @inlinable
    @inline(__always)
    var transliteration: String {
        return root.transliteration!
    }

    typealias KeyType = UInt64

    @inlinable
    @inline(__always)
    var key: KeyType {
        return root.key
    }
}
