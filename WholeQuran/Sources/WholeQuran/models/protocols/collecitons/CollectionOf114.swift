//
//  SurahCollection.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol CollectionOf114: CollectionOneBased {
}

extension CollectionOf114 {
    @inlinable
    @inline(__always)
    public var endIndex: Int {
        return 115
    }
}
