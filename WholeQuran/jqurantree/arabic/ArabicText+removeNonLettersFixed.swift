//
//  ArabicText+removeNonLettersFixed.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

extension ArabicText {
    func removeNonLettersFixed() -> ArabicText {
        let letterCount: ArrayOffset = getLetterCount()
        if letterCount != characterCount {
            var buffer = [CharByte](repeating: 0, count: Int(letterCount) * 3) // ByteArray(letterCount * 3)
            var offset1 = 0
            var offset2: ArrayOffset = offset
            for _ in 0 ... characterCount - 1 {
                if ByteFormat.isLetter(buffer, offset2) {
                    buffer[offset1] = buffer[Int(offset2)]
                    offset1 += 3
                }
                offset2 += 3
            }
            return ArabicText(buffer: buffer, offset: 0, characterCount: letterCount)
        }

        return self
    }
}
