//
//  CollectionFlatBuffer.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol CollectionInt: Collection where Index == Int {

}

extension CollectionInt {
    @inlinable
    @inline(__always)
    func index(after i: Int) -> Int {
        return i + 1
    }
}
