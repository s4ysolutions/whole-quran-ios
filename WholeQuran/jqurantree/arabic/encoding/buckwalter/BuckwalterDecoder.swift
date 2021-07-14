//
//  BuckwalterDecoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class BuckwalterDecoder: ArabicDecoderBase {
    public init() {
        super.init(BuckwalterTable.buckwalterTable)
    }
}
