//
//  ColectionWithStringKey.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol ColectionWithSearchKey: CollectionInt where Element: HavingSearchKey {
    func by(key: Self.Element.KeyType) -> Self.Element?
}

extension ColectionWithSearchKey {
    func by(key: Self.Element.KeyType) -> Self.Element? {
        var lowerIndex = 0
        var upperIndex = endIndex - 1

        while true {
            let currentIndex = (lowerIndex + upperIndex)/2
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
