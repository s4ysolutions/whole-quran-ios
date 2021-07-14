//
//  CharacterType.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

enum CharacterType: String, CaseIterable {
    case Alif
    case Ba
    case Ta
    case Tha
    case Jeem
    case HHa
    case Kha
    case Dal
    case Thal
    case Ra
    case Zain
    case Seen
    case Sheen
    case Sad
    case DDad
    case TTa
    case DTha
    case Ain
    case Ghain
    case Fa
    case Qaf
    case Kaf
    case Lam
    case Meem
    case Noon
    case Ha
    case Waw
    case Ya
    case Hamza
    case AlifMaksura
    case TaMarbuta
    case Tatweel
    case SmallHighSeen
    case SmallHighRoundedZero
    case SmallHighUprightRectangularZero
    case SmallHighMeemIsolatedForm
    case SmallLowSeen
    case SmallWaw
    case SmallYa
    case SmallHighNoon
    case EmptyCentreLowStop
    case EmptyCentreHighStop
    case RoundedHighStopWithFilledCentre
    case SmallLowMeem

    static func valueOf(ordinal: Int) -> CharacterType {
        return CharacterType.allCases[ordinal]
    }

    static func valueOf(ordinal: CharByte) -> CharacterType {
        return CharacterType.allCases[Int(ordinal)]
    }

    static let values = CharacterType.allCases
    @inlinable
    static func ordinal(_ char: CharacterType) -> Int {
        return values.firstIndex(of: char)!
    }

    @inlinable
    var ordinal: Int {
        return CharacterType.ordinal(self)
    }
}
