//
//  SimpleEncoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class SimpleEncoder: ArabicEncoderBase {
    override func encodeCharacter(_ buffer: [CharByte], _ offset: ArrayOffset) {
        if buffer[Int(offset)] == ByteFormat.WHITESPACE {
            text.append("")
        } else {
            let characterType: CharacterType = CharacterType.valueOf(ordinal: buffer[offset])
            if (characterType == CharacterType.Alif) &&
                ByteFormat.isSingleDiacritic(buffer, offset, DiacriticType.AlifKhanjareeya) {
                text.append("AlifKhanjareeya")
            } else {
                text.append(characterType.rawValue)
                for diacriticType in DiacriticType.values {
                    if ByteFormat.isDiacritic(buffer, offset, diacriticType) {
                        text.append(" + ")
                        text.append(diacriticType.rawValue)
                    }
                }
            }
        }
    }

    override func writeCharacterSeperator() {
        text.append(" | ")
    }
}
