//
//  EncodingTableBase.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

class EncodingTableBase {
    private var unicodeMap: [UnicodeCharacter: EncodingTableItem] = [:]

    private var characterList: [UnicodeCharacter] = Array(repeating: UnicodeCharacter("\u{0}"),
                                                          count: CharacterType.values.count)
    private var unicodeList: [UnicodeCharacter] = Array(repeating: UnicodeCharacter("\u{0}"),
                                                        count: UnicodeType.values.count)

    func getItem(_ unicode: UnicodeCharacter) -> EncodingTableItem? {
        return unicodeMap[unicode]
    }

    func getCharacter(_ characterType: CharacterType) -> Character {
        return Character(getUnicodeCharacter(characterType))
    }

    func getUnicodeCharacter(_ characterType: CharacterType) -> UnicodeCharacter {
        return characterList[characterType.ordinal]
    }

    func getCharacter(_ unicodeType: UnicodeType) -> Character {
        return Character(getUnicodeCharacter(unicodeType))
    }

    func getUnicodeCharacter(_ unicodeType: UnicodeType) -> UnicodeCharacter {
        return unicodeList[unicodeType.ordinal]
    }

    func addItem(_ unicodeType: UnicodeType, _ ch: UnicodeCharacter, _ characterType: CharacterType) {
        addItem(unicodeType, ch, characterType, nil)
    }

    func addItem(_ unicodeType: UnicodeType!, _ ch: UnicodeCharacter, _ diacriticType: DiacriticType!) {
        addItem(unicodeType, ch, nil, diacriticType)
    }

    func addItem(_ unicodeType: UnicodeType!,
                 _ ch: UnicodeCharacter,
                 _ characterType: CharacterType!,
                 _ diacriticType: DiacriticType!) {
        //  Create the item that will be added to the table.
        let item: EncodingTableItem! = EncodingTableItem(characterType, diacriticType)
        //  Unicode --> item
        unicodeMap[ch] = item
        //  Character type --> Unicode
        if characterType != nil && (diacriticType == nil) {
            characterList[characterType.ordinal] = ch
        }
        //  Unicode type --> Unicode
        unicodeList[unicodeType.ordinal] = ch
    }
}
