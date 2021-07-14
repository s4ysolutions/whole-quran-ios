//
//  ArabicEncoderBase.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

class ArabicEncoderBase: ArabicEncoder {
    private var buffer: [CharByte]!
    private var offset: ArrayOffset = 0
    private var value: CharByte = 0
    private var isMaddah: Bool = false
    private var isHamzaAbove: Bool = false
    private let encodingTable: EncodingTableBase!
    private var options: EncodingOptions?
    // *
    //      * A string buffer used to hold the encoder's plain text
    //      * output.
    //
    //
    public var text: String = String()

    // SimpleEncoder does not use table
    public init() {
        encodingTable = nil
    }

    public init(_ encodingTable: EncodingTableBase) {
        self.encodingTable = encodingTable
    }

    open func encode(_ buffer: [CharByte],
                     _ offset: ArrayOffset,
                     _ characterCount: ArrayOffset,
                     _ options: EncodingOptions?) -> String {
        self.options = options
        //  Encode each Arabic character.
        var _offset = offset
        for i in 0 ... characterCount - 1 {
            //  Seperator.
            if i > 0 {
                writeCharacterSeperator()
            }
            //  Encode character.
            encodeCharacter(buffer, _offset)
            _offset += ByteFormat.CHARACTER_WIDTH
        }
        //  Return text.
        return text
    }

    // *
    //      * Overriden by derived encoders to write a seperator between each
    //      * {@link org.jqurantree.arabic.ArabicCharacter}.
    //      *
    open func writeCharacterSeperator() {
    }

    // *
    //      * Encodes a single {@link org.jqurantree.arabic.ArabicCharacter} in the
    //      * internal {@link org.jqurantree.arabic.ByteFormat}.
    //      *
    //      * @param buffer
    //      *            the byte[] buffer holding the character
    //      * @param offset
    //      *            the offset of the character within the buffer
    open func encodeCharacter(_ buffer: [CharByte], _ offset: ArrayOffset) {
        //  Initiate.
        self.buffer = buffer
        self.offset = offset
        //  Whitespace?
        value = buffer[offset]
        if value == ByteFormat.WHITESPACE {
            //  Write whitespace.
            text.append(" ")
        } else {
            //  Write character.
            text.append(getCharacter())
            //  Write diacritics.
            writeDiacritics()
        }
    }

    private func getCharacter() -> Character {
        return Character(getUnicodeCharacter())
    }

    private func getUnicodeCharacter() -> UnicodeCharacter {
        //  Initiate.
        let characterType: CharacterType =
            CharacterType.valueOf(ordinal: value)
        var unicodeType: UnicodeType!
        isMaddah = ByteFormat.isMaddah(buffer, offset)
        isHamzaAbove = ByteFormat.isHamzaAbove(buffer, offset)
        //  Alif + Maddah
        if (options == EncodingOptions.CombineAlifWithMaddah) &&
            (characterType == CharacterType.Alif) &&
            ByteFormat.isMaddah(buffer, offset) {
            unicodeType = UnicodeType.AlifWithMaddah
            isMaddah = false
        } else {
            if (characterType == CharacterType.Alif) &&
                isHamzaAbove &&
                !ByteFormat.isAlifKhanjareeya(buffer, offset) {
                unicodeType = UnicodeType.AlifWithHamzaAbove
                isHamzaAbove = false
            } else {
                if (characterType == CharacterType.Waw) && isHamzaAbove {
                    unicodeType = UnicodeType.WawWithHamzaAbove
                    isHamzaAbove = false
                } else {
                    if (characterType == CharacterType.Alif) && ByteFormat.isHamzaBelow(buffer, offset) {
                        unicodeType = UnicodeType.AlifWithHamzaBelow
                    } else {
                        if (characterType == CharacterType.Ya) && isHamzaAbove {
                            unicodeType = UnicodeType.YaWithHamzaAbove
                            isHamzaAbove = false
                        } else {
                            if (characterType == CharacterType.Alif) && ByteFormat.isAlifKhanjareeya(buffer, offset) {
                                unicodeType = UnicodeType.AlifKhanjareeya
                            } else {
                                if (characterType == CharacterType.Alif) && ByteFormat.isHamzatWasl(buffer, offset) {
                                    unicodeType = UnicodeType.AlifWithHamzatWasl
                                }
                            }
                        }
                    }
                }
            }
        }
        //  Return character.
        return (unicodeType != nil
            ? encodingTable.getUnicodeCharacter(unicodeType)
            : encodingTable.getUnicodeCharacter(characterType))
    }

    private func writeDiacritics() {
        //  Hamza above.
        if isHamzaAbove {
            text.append(encodingTable.getCharacter(UnicodeType.HamzaAbove))
        }
        //  Shadda.
        if ByteFormat.isShadda(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Shadda))
        }
        //  Fathatan.
        if ByteFormat.isFathatan(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Fathatan))
        }
        //  Dammatan.
        if ByteFormat.isDammatan(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Dammatan))
        }
        //  Kasratan.
        if ByteFormat.isKasratan(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Kasratan))
        }
        //  Fatha.
        if ByteFormat.isFatha(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Fatha))
        }
        //  Damma.
        if ByteFormat.isDamma(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Damma))
        }
        //  Kasra.
        if ByteFormat.isKasra(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Kasra))
        }
        //  Sukun.
        if ByteFormat.isSukun(buffer, offset) {
            text.append(encodingTable.getCharacter(UnicodeType.Sukun))
        }
        //  Maddah.
        if isMaddah {
            text.append(encodingTable.getCharacter(UnicodeType.Maddah))
        }
    }
}
