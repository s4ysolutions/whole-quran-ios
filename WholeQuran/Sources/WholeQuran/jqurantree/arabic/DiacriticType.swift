//
//  DiacriticType.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

enum DiacriticType: String {
    case Fatha
    case Damma
    case Kasra
    case Fathatan
    case Dammatan
    case Kasratan
    case Shadda
    case Sukun
    case Maddah
    case HamzaAbove
    case HamzaBelow
    case HamzatWasl
    case AlifKhanjareeya

    static let values = [Fatha, Damma, Kasra, Fathatan, Dammatan, Kasratan,
                         Shadda, Sukun, Maddah, HamzaAbove, HamzaBelow,
                         HamzatWasl, AlifKhanjareeya]

    static func ordinal(_ char: DiacriticType) -> Int {
        return values.firstIndex(of: char)!
    }

    var ordinal: Int {
        return DiacriticType.ordinal(self)
    }
}
