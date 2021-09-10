//
//  EncodingTableItem.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

class EncodingTableItem {
    private let characterType: CharacterType!
    private let diacriticType: DiacriticType!

    public init(_ characterType: CharacterType!, _ diacriticType: DiacriticType!) {
        self.characterType = characterType
        self.diacriticType = diacriticType
    }

    open func getCharacterType() -> CharacterType! {
        return self.characterType
    }

    open func getDiacriticType() -> DiacriticType! {
        return self.diacriticType
    }
}
