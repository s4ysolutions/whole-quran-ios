//
//  UnicodeEncoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

class UnicodeEncoder: ArabicEncoderBase {
    public override init() {
        super.init(UnicodeTable.getUnicodeTable())
    }
}
