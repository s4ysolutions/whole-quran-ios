//
//  ArabicDecoderBase.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class ArabicDecoderBase: ArabicDecoder {
    private let encodingTable: EncodingTableBase
    private let builder: ArabicTextBuilder = ArabicTextBuilder()

    public init(_ encodingTable: EncodingTableBase!) {
        self.encodingTable = encodingTable
    }

    open func decode(_ text: String) -> [CharByte] {
        for char in text.unicodeScalars {
            self.decode(char)
        }
        return self.builder.toByteArray()
    }

    private func decode(_ ch: UnicodeCharacter) {
        let item: EncodingTableItem! = self.encodingTable.getItem(ch)
        if item != nil {
            let characterType: CharacterType! = item.getCharacterType()
            let diacriticType: DiacriticType! = item.getDiacriticType()
            if characterType != nil {
                self.builder.add(characterType)
            }
            if diacriticType != nil {
                self.builder.add(diacriticType)
            }
        } else {
            self.builder.addWhitespace()
        }
    }
}
