//
//  WBWEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//
import Foundation

public struct WBWEntryModelFlatBuffers: WBWEntryModel, HavingItemKey {

    let root: com_quranic_wholequran_fbs_WordByWordEntry

    public var id: String {
        return root.id!
    }

    public var meaning: String {
        return root.meaning!
    }

    public var transliteration: String {
        return root.transliteration!
    }

    typealias KeyType = UInt64

    var key: KeyType {
        return root.key
    }
}
