//
//  UnicodeType.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

enum UnicodeType: CaseIterable {
    /**
     * Unicode character U+0621.
     */
    case Hamza

    /**
     * Unicode character U+0622.
     */
    case AlifWithMaddah

    /**
     * Unicode character U+0623.
     */
    case AlifWithHamzaAbove

    /**
     * Unicode character U+0624.
     */
    case WawWithHamzaAbove

    /**
     * Unicode character U+0625.
     */
    case AlifWithHamzaBelow

    /**
     * Unicode character U+0626.
     */
    case YaWithHamzaAbove

    /**
     * Unicode character U+0627.
     */
    case Alif

    /**
     * Unicode character U+0628.
     */
    case Ba

    /**
     * Unicode character U+0629.
     */
    case TaMarbuta

    /**
     * Unicode character U+062A.
     */
    case Ta

    /**
     * Unicode character U+062B.
     */
    case Tha

    /**
     * Unicode character U+062C.
     */
    case Jeem

    /**
     * Unicode character U+062D.
     */
    case HHa

    /**
     * Unicode character U+062E.
     */
    case Kha

    /**
     * Unicode character U+062F.
     */
    case Dal

    /**
     * Unicode character U+0630.
     */
    case Thal

    /**
     * Unicode character U+0631.
     */
    case Ra

    /**
     * Unicode character U+0632.
     */
    case Zain

    /**
     * Unicode character U+0633.
     */
    case Seen

    /**
     * Unicode character U+0634.
     */
    case Sheen

    /**
     * Unicode character U+0635.
     */
    case Sad

    /**
     * Unicode character U+0636.
     */
    case DDad

    /**
     * Unicode character U+0637.
     */
    case TTa

    /**
     * Unicode character U+0638.
     */
    case DTha

    /**
     * Unicode character U+0639.
     */
    case Ain

    /**
     * Unicode character U+063A.
     */
    case Ghain

    /**
     * Unicode character U+0640.
     */
    case Tatweel

    /**
     * Unicode character U+0641.
     */
    case Fa

    /**
     * Unicode character U+0642.
     */
    case Qaf

    /**
     * Unicode character U+0643.
     */
    case Kaf

    /**
     * Unicode character U+0644.
     */
    case Lam

    /**
     * Unicode character U+0645.
     */
    case Meem

    /**
     * Unicode character U+0646.
     */
    case Noon

    /**
     * Unicode character U+0647.
     */
    case Ha

    /**
     * Unicode character U+0648.
     */
    case Waw

    /**
     * Unicode character U+0649.
     */
    case AlifMaksura

    /**
     * Unicode character U+064A.
     */
    case Ya

    /**
     * Unicode character U+064B.
     */
    case Fathatan

    /**
     * Unicode character U+064C.
     */
    case Dammatan

    /**
     * Unicode character U+064D.
     */
    case Kasratan

    /**
     * Unicode character U+064E.
     */
    case Fatha

    /**
     * Unicode character U+064F.
     */
    case Damma

    /**
     * Unicode character U+0650.
     */
    case Kasra

    /**
     * Unicode character U+0651.
     */
    case Shadda

    /**
     * Unicode character U+0652.
     */
    case Sukun

    /**
     * Unicode character U+0653.
     */
    case Maddah

    /**
     * Unicode character U+0654.
     */
    case HamzaAbove

    /**
     * Unicode character U+0670.
     */
    case AlifKhanjareeya

    /**
     * Unicode character U+0671.
     */
    case AlifWithHamzatWasl

    /**
     * Unicode character U+06DC.
     */
    case SmallHighSeen

    /**
     * Unicode character U+06DF.
     */
    case SmallHighRoundedZero

    /**
     * Unicode character U+06E0.
     */
    case SmallHighUprightRectangularZero

    /**
     * Unicode character U+06E2.
     */
    case SmallHighMeemIsolatedForm

    /**
     * Unicode character U+06E3.
     */
    case SmallLowSeen

    /**
     * Unicode character U+06E5.
     */
    case SmallWaw

    /**
     * Unicode character U+06E6.
     */
    case SmallYa

    /**
     * Unicode character U+06E8.
     */
    case SmallHighNoon

    /**
     * Unicode character U+06EA.
     */
    case EmptyCentreLowStop

    /**
     * Unicode character U+06EB.
     */
    case EmptyCentreHighStop

    /**
     * Unicode character U+06EC.
     */
    case RoundedHighStopWithFilledCentre

    /**
     * Unicode character U+06ED.
     */
    case SmallLowMeem

    static let values = UnicodeType.allCases
    static func ordinal(_ char: UnicodeType) -> Int {
        return values.firstIndex(of: char)!
    }

    var ordinal: Int {
        return UnicodeType.ordinal(self)
    }
}
