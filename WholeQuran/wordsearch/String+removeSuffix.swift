//
//  String+removeSuffix.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

extension String {
    func wholeQuranRemoveSuffix(_ suffix: String) -> String.SubSequence {
        if self.hasSuffix(suffix) {
            let i = self.index(self.endIndex, offsetBy: -suffix.count)
            return self[..<i]
        } else {
            return self[..<self.endIndex]
        }
    }
}
