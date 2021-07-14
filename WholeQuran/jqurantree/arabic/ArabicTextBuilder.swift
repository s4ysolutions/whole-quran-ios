//
//  ArabicTextBuilder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

typealias ArabicTextBuilderBufferType = CharByte
class ArabicTextBuilder {
    private let INITIAL_CAPACITY: Int = 4
    private var buffer: [ArabicTextBuilderBufferType]
    private var characterCount: Int = 0
    private var characterCapacity: Int = 0

    public convenience init() {
        self.init(4)
    }

    public init(_ characterCapacity: Int) {
        self.characterCapacity = characterCapacity
        buffer = [ArabicTextBuilderBufferType](repeating: 0, count: characterCapacity * 3)
    }

    open func add(_ characterType: CharacterType?) {
        var offset: ArrayOffset
        if characterCount >= characterCapacity {
            offset = characterCapacity * 2
            var newBuffer = [ArabicTextBuilderBufferType](repeating: 0, count: Int(offset) * 3)
            for ci in 0 ... (characterCapacity * 3) - 1 {
                newBuffer[ci] = buffer[ci]
            }
            buffer = newBuffer
            characterCapacity = offset
        }
        offset = characterCount * 3
        buffer[offset] = characterType == nil ? ByteFormat.WHITESPACE : CharByte(characterType!.ordinal)
        buffer[offset + 1] = 0
        buffer[offset + 2] = 0
        characterCount += 1
    }

    open func add(_ diacriticType: DiacriticType) {
        let offset = (characterCount - 1) * 3
        ByteFormat.setDiacritic(&buffer, offset, diacriticType)
    }

    open func add(_ characterType: CharacterType, _ diaciritcTypes: DiacriticType...) {
        add(characterType)
        let arr$ = diaciritcTypes
        _ = diaciritcTypes.count

        for diacriticType in arr$ {
            add(diacriticType)
        }
    }

    open func addWhitespace() {
        add(nil)
    }

    open func toString() -> String {
        return toText().toString()
    }

    open func toText() -> ArabicText! {
        return ArabicText(buffer: toByteArray())
    }

    open func toByteArray() -> [CharByte] {
        var buffer = self.buffer
        let byteCount = characterCount * 3
        if byteCount != buffer.count {
            buffer = [CharByte](repeating: 0, count: byteCount)
            for i in 0 ... byteCount - 1 {
                buffer[i] = self.buffer[i]
            }
        }
        return buffer
    }
}
