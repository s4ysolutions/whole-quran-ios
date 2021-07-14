//
//  String+subscriptInt.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 13.07.2021.
//

import Foundation

extension String {
    func char(atPosition position: Int) -> UnicodeCharacter {
        return self.unicodeScalars[index(startIndex, offsetBy: position)]
    }
}
