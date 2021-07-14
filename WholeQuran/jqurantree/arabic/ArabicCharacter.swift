//
//  ArabicCharacter.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

class ArabicCharacter {
    private let buffer: [CharByte]
    private var offset: ArrayOffset = 0

    internal init(_ buffer: [CharByte], _ offset: ArrayOffset) {
        self.buffer = buffer
        self.offset = offset
    }

    open func getType() -> CharacterType {
        return CharacterType.valueOf(ordinal: self.buffer[self.offset])
    }

    open func isFatha() -> Bool {
        return ByteFormat.isFatha(self.buffer, self.offset)
    }

    open func isDamma() -> Bool {
        return ByteFormat.isDamma(self.buffer, self.offset)
    }

    open func isKasra() -> Bool {
        return ByteFormat.isKasra(self.buffer, self.offset)
    }

    open func isFathatan() -> Bool {
        return ByteFormat.isFathatan(self.buffer, self.offset)
    }

    open func isDammatan() -> Bool {
        return ByteFormat.isDammatan(self.buffer, self.offset)
    }

    open func isKasratan() -> Bool {
        return ByteFormat.isKasratan(self.buffer, self.offset)
    }

    open func isShadda() -> Bool {
        return ByteFormat.isShadda(self.buffer, self.offset)
    }

    open func isSukun() -> Bool {
        return ByteFormat.isSukun(self.buffer, self.offset)
    }

    open func isMaddah() -> Bool {
        return ByteFormat.isMaddah(self.buffer, self.offset)
    }

    open func isHamzaAbove() -> Bool {
        return ByteFormat.isHamzaAbove(self.buffer, self.offset)
    }

    open func isHamzaBelow() -> Bool {
        return ByteFormat.isHamzaBelow(self.buffer, self.offset)
    }

    open func isHamzatWasl() -> Bool {
        return ByteFormat.isHamzatWasl(self.buffer, self.offset)
    }

    open func isAlifKhanjareeya() -> Bool {
        return ByteFormat.isAlifKhanjareeya(self.buffer, self.offset)
    }

    open func isSingleDiacritic(_ diacriticType: DiacriticType!) -> Bool {
        return ByteFormat.isSingleDiacritic(self.buffer, self.offset, diacriticType)
    }

    open func getDiacriticCount() -> ArrayOffset {
        return ByteFormat.getDiacriticCount(self.buffer, self.offset)
    }

    open func isLetter() -> Bool {
        return ByteFormat.isLetter(self.buffer, self.offset)
    }

    open func toString() -> String {
        return self.toString(EncodingType.Simple)
    }

    open func toString(_ encodingType: EncodingType) -> String {
        return EncodingFactory.getEncoder(encodingType).encode(self.buffer, self.offset, 1, nil)
    }

    open func toUnicode() -> String {
        return self.toString(EncodingType.Unicode)
    }

    open func toBuckwalter() -> String {
        return self.toString(EncodingType.Buckwalter)
    }

    open func toSimpleEncoding() -> String {
        return self.toString(EncodingType.Simple)
    }
}
