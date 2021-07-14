//
//  ByteFormat.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

class ByteFormat {
    public static let CHARACTER_WIDTH = 3
    public static let WHITESPACE: CharByte = CharByte(bitPattern: -1)
    private static let diacriticOffsets: [Int] = [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2]
    private static let diacriticMasks: [UInt8] = [1, 2, 4, 8, 16, 32, 64, 128, 1, 2, 4, 8, 16]

    public static func setDiacritic(
        _ buffer: inout [ArabicTextBuilderBufferType],
        _ offset: ArrayOffset,
        _ diacriticType: DiacriticType) {
        let value: ArrayOffset = diacriticType.ordinal
        let byteOffset: ArrayOffset = offset + diacriticOffsets[value]
        let bitMask = diacriticMasks[value]
        buffer[byteOffset] = buffer[byteOffset] | bitMask
    }

    public static func isDiacritic(
        _ buffer: [CharByte],
        _ offset: ArrayOffset,
        _ diacriticType: DiacriticType!) -> Bool {
        let value: ArrayOffset = diacriticType.ordinal
        let byteOffset: ArrayOffset = offset + diacriticOffsets[value]
        let bitMask = diacriticMasks[value]
        return buffer[byteOffset] & bitMask != 0
    }

    public static func isFatha(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 1) != 0
    }

    public static func isDamma(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 2) != 0
    }

    public static func isKasra(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 4) != 0
    }

    public static func isFathatan(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 8) != 0
    }

    public static func isDammatan(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 16) != 0
    }

    public static func isKasratan(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 32) != 0
    }

    public static func isShadda(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 64) != 0
    }

    public static func isSukun(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 1] & 128) != 0
    }

    public static func isMaddah(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 2] & 1) != 0
    }

    public static func isHamzaAbove(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 2] & 2) != 0
    }

    public static func isHamzaBelow(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 2] & 4) != 0
    }

    public static func isHamzatWasl(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 2] & 8) != 0
    }

    public static func isAlifKhanjareeya(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return (buffer[offset + 2] & 16) != 0
    }

    public static func isSingleDiacritic(
        _ buffer: [CharByte],
        _ offset: ArrayOffset,
        _ diacriticType: DiacriticType!) -> Bool {
        let ordinal: ArrayOffset = diacriticType.ordinal
        let diacriticOffset: ArrayOffset = diacriticOffsets[ordinal]
        let bitMask: CharByte = diacriticMasks[ordinal]
        return (buffer[offset + diacriticOffset] == bitMask) && (buffer[(offset + 3) - diacriticOffset] == 0)
    }

    public static func getDiacriticCount(_ buffer: [CharByte], _ offset: ArrayOffset) -> ArrayOffset {
        var count: ArrayOffset = 0
        assert(diacriticMasks.count == diacriticOffsets.count)
        for i in 0 ... (diacriticMasks.count - 1)
            where (buffer[offset + diacriticOffsets[i]] & diacriticMasks[i]) != 0 {
            count += 1
        }
        return count
    }

    public static func isLetter(_ buffer: [CharByte], _ offset: ArrayOffset) -> Bool {
        return buffer[offset] <= CharacterType.Tatweel.ordinal
    }
}
