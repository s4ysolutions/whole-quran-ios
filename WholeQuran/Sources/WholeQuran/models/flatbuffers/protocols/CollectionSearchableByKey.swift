//
//  CollectionSearchableFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

protocol HavingItemKey {
    associatedtype KeyType: Comparable
    var key: KeyType { get }
}

protocol CollectionSearchableByKey: CollectionSearchable
    where Element: HavingItemKey {
}

extension CollectionSearchableByKey {
    public func by(key: Element.KeyType) -> Self.Element? {
        var lowerIndex = startIndex
        var upperIndex = endIndex - 1

        while true {
            let currentIndex = (lowerIndex + upperIndex) / 2
            if self[currentIndex].key == key {
                return self[currentIndex]
            } else if lowerIndex > upperIndex {
                return nil
            } else {
                if self[currentIndex].key > key {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }
}

protocol CollectionSearchableByKeyFromFlatBuffers: CollectionSearchableByKey, CollectionZeroBasedFlatBuffersProvided {
}
