//
//  BuckwalterEncoder.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class BuckwalterEncoder: ArabicEncoderBase {
    public override init() {
        super.init(BuckwalterTable.buckwalterTable)
    }
}
