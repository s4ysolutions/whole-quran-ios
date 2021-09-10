//
//  ArabicEncoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

protocol ArabicEncoder {
    func encode(
        _ buffer: [CharByte],
        _ offset: ArrayOffset,
        _ characterCount: ArrayOffset,
        _ options: EncodingOptions?) -> String
}
