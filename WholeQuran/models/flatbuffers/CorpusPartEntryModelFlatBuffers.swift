//
//  CorpusPartEntryModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 08.07.2021.
//

import Foundation

struct CorpusPartEntryModelFlatBuffers: CorpusPartEntryModel {
    let root: com_quranic_wholequran_fbs_CorpusPartEntry

    @inlinable
    @inline(__always)
    var form: String {
        return root.form!
    }

    @inlinable
    @inline(__always)
    var lem: String {
        return root.lem!
    }
}
