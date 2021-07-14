//
//  UnicodeDecoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class UnicodeDecoder: ArabicDecoderBase {
    public init() {
        super.init(UnicodeTable.getUnicodeTable())
    }
}
