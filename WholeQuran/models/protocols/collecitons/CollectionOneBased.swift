//
//  CollectionOneBasedFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol CollectionOneBased: CollectionInt {
}

extension CollectionOneBased {
    @inlinable
    @inline(__always)
    var startIndex: Int {
        return 1
    }
}
