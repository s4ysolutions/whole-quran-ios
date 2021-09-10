//
//  CollectionOneBasedFlatbuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

public protocol CollectionOneBased: CollectionInt {
}

extension CollectionOneBased {
    @inlinable
    @inline(__always)
    public var startIndex: Int {
        return 1
    }
}
