//
//  ArabicText+toConsonants.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

extension ArabicText {
    func toConsonants() -> String {
        return removeDiacritics().removeNonLettersFixed().toUnicode().removeAlefAndSuch()
    }
}
