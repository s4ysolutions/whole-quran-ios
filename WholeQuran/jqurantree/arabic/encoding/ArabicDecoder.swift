//
//  ArabicDecoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

protocol ArabicDecoder {
    func decode(_ text: String) -> [CharByte]
}
