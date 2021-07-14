//
//  CollectionZeroBasedFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol CollectionZeroBased: CollectionInt {
}

extension CollectionZeroBased {
    @inlinable
    @inline(__always)
    var startIndex: Int {
        return 0
    }
}
