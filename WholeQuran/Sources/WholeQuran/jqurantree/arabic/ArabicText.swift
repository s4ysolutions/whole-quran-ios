//
//  ArabicText.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

class ArabicText {
    public let buffer: [CharByte]
    public let offset: ArrayOffset
    public let characterCount: ArrayOffset

    convenience init(buffer: [CharByte]) {
        self.init(buffer: buffer, offset: 0, characterCount: buffer.count / 3)
    }

    convenience init(text: String) {
        self.init(text: text, encodingType: EncodingType.Unicode)
    }

    convenience init(text: String, encodingType: EncodingType) {
        self.init(buffer: EncodingFactory.getDecoder(encodingType).decode(text))
    }

    init(buffer: [CharByte], offset: ArrayOffset, characterCount: ArrayOffset) {
        self.buffer = buffer
        self.offset = offset
        self.characterCount = characterCount
    }

    public static func fromUnicode(_ text: String) -> ArabicText {
        return fromEncoding(text, EncodingType.Unicode)
    }

    public static func fromBuckwalter(_ text: String) -> ArabicText {
        return fromEncoding(text, EncodingType.Buckwalter)
    }

    public static func fromEncoding(_ text: String, _ encodingType: EncodingType = .Unicode) -> ArabicText {
        return ArabicText(text: text, encodingType: encodingType)
    }

    open func toString() -> String {
        return toString(EncodingType.Unicode, nil)
    }

    open func toString(_ encodingType: EncodingType) -> String {
        return toString(encodingType, nil)
    }

    open func toString(_ encodingType: EncodingType, _ options: EncodingOptions?) -> String {
        let encoder: ArabicEncoder! = EncodingFactory.getEncoder(encodingType)
        return encoder.encode(buffer, offset, characterCount, options)
    }

    open func toUnicode() -> String {
        return toString(EncodingType.Unicode)
    }

    open func toBuckwalter() -> String {
        return toString(EncodingType.Buckwalter)
    }

    open func toSimpleEncoding() -> String {
        return toString(EncodingType.Simple)
    }

    open func getLength() -> ArrayOffset {
        return characterCount
    }

    open func getCharacter(_ index: ArrayOffset) -> ArabicCharacter {
        return ArabicCharacter(buffer, offset + (index * 3))
    }

    open func getCharacterType(_ index: ArrayOffset) -> CharacterType? {
        let value = buffer[offset + (index * 3)]
        return (value != ByteFormat.WHITESPACE ? CharacterType.values[Int(value)] : nil)
    }

    /*
     open func iterator() -> Iterator! {
         return CharacterIterator(buffer, offset, characterCount)
     }
     */
    open func getSubstring(_ start: ArrayOffset, _ end: ArrayOffset) -> ArabicText {
        return ArabicText(buffer: buffer, offset: offset + (start * 3), characterCount: end - start)
    }

    open func removeDiacritics() -> ArabicText! {
        var buffer = [CharByte](repeating: 0, count: Int(characterCount) * 3)
        var offset1: ArrayOffset = 0
        var offset2: ArrayOffset = offset
        var i: ArrayOffset = 0
        while i < characterCount {
            buffer[Int(offset1)] = self.buffer[Int(offset2)]
            offset1 += 3
            offset2 += 3
            i += 1
        }
        return ArabicText(buffer: buffer, offset: 0, characterCount: characterCount)
    }

    open func getLetterCount() -> ArrayOffset {
        var count: ArrayOffset = 0
        var offset: ArrayOffset = self.offset
        var i: ArrayOffset = 0
        while i < characterCount {
            if ByteFormat.isLetter(buffer, offset) {
                count += 1
            }
            offset += 3
            i += 1
        }
        return count
    }

    open func removeNonLetters() -> ArabicText! {
        var text: ArabicText! = self
        let letterCount: ArrayOffset = getLetterCount()
        if letterCount != characterCount {
            var buffer = [CharByte](repeating: 0, count: Int(letterCount) * 3)
            var offset1: ArrayOffset = 0
            var offset2: ArrayOffset = offset
            var i: ArrayOffset = 0
            while i < characterCount {
                if ByteFormat.isLetter(self.buffer, offset2) {
                    buffer[Int(offset1)] = self.buffer[offset2]
                    offset1 += 3
                }
                offset2 += 3
                i += 1
            }
            text = ArabicText(buffer: buffer, offset: 0, characterCount: letterCount)
        }
        return text
    }
}
