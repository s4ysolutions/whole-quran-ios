//
//  ColectionWithStringKey.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

public protocol CollectionSearchable: CollectionZeroBased {
    associatedtype KeyType: Comparable
    func by(key: KeyType) -> Self.Element?
}
