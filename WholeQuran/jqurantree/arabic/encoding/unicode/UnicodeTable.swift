//
//  UnicodeTableBase.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

class UnicodeTable: EncodingTableBase {
    public static let unicodeTable: UnicodeTable = UnicodeTable()

    public static func getUnicodeTable() -> UnicodeTable! {
        return unicodeTable
    }

    override private init() {
        super.init()
        addItem(UnicodeType.Hamza, "\u{621}", CharacterType.Hamza)
        addItem(UnicodeType.AlifWithMaddah, "\u{622}", CharacterType.Alif, DiacriticType.Maddah)
        addItem(UnicodeType.AlifWithHamzaAbove, "\u{623}", CharacterType.Alif, DiacriticType.HamzaAbove)
        addItem(UnicodeType.WawWithHamzaAbove, "\u{624}", CharacterType.Waw, DiacriticType.HamzaAbove)
        addItem(UnicodeType.AlifWithHamzaBelow, "\u{625}", CharacterType.Alif, DiacriticType.HamzaBelow)
        addItem(UnicodeType.YaWithHamzaAbove, "\u{626}", CharacterType.Ya, DiacriticType.HamzaAbove)
        addItem(UnicodeType.Alif, "\u{627}", CharacterType.Alif)
        addItem(UnicodeType.Ba, "\u{628}", CharacterType.Ba)
        addItem(UnicodeType.TaMarbuta, "\u{629}", CharacterType.TaMarbuta)
        addItem(UnicodeType.Ta, "\u{62A}", CharacterType.Ta)
        addItem(UnicodeType.Tha, "\u{62B}", CharacterType.Tha)
        addItem(UnicodeType.Jeem, "\u{62C}", CharacterType.Jeem)
        addItem(UnicodeType.HHa, "\u{62D}", CharacterType.HHa)
        addItem(UnicodeType.Kha, "\u{62E}", CharacterType.Kha)
        addItem(UnicodeType.Dal, "\u{62F}", CharacterType.Dal)
        addItem(UnicodeType.Thal, "\u{630}", CharacterType.Thal)
        addItem(UnicodeType.Ra, "\u{631}", CharacterType.Ra)
        addItem(UnicodeType.Zain, "\u{632}", CharacterType.Zain)
        addItem(UnicodeType.Seen, "\u{633}", CharacterType.Seen)
        addItem(UnicodeType.Sheen, "\u{634}", CharacterType.Sheen)
        addItem(UnicodeType.Sad, "\u{635}", CharacterType.Sad)
        addItem(UnicodeType.DDad, "\u{636}", CharacterType.DDad)
        addItem(UnicodeType.TTa, "\u{637}", CharacterType.TTa)
        addItem(UnicodeType.DTha, "\u{638}", CharacterType.DTha)
        addItem(UnicodeType.Ain, "\u{639}", CharacterType.Ain)
        addItem(UnicodeType.Ghain, "\u{63A}", CharacterType.Ghain)
        addItem(UnicodeType.Tatweel, "\u{640}", CharacterType.Tatweel)
        addItem(UnicodeType.Fa, "\u{641}", CharacterType.Fa)
        addItem(UnicodeType.Qaf, "\u{642}", CharacterType.Qaf)
        addItem(UnicodeType.Kaf, "\u{643}", CharacterType.Kaf)
        addItem(UnicodeType.Lam, "\u{644}", CharacterType.Lam)
        addItem(UnicodeType.Meem, "\u{645}", CharacterType.Meem)
        addItem(UnicodeType.Noon, "\u{646}", CharacterType.Noon)
        addItem(UnicodeType.Ha, "\u{647}", CharacterType.Ha)
        addItem(UnicodeType.Waw, "\u{648}", CharacterType.Waw)
        addItem(UnicodeType.AlifMaksura, "\u{649}", CharacterType.AlifMaksura)
        addItem(UnicodeType.Ya, "\u{64A}", CharacterType.Ya)
        addItem(UnicodeType.Fathatan, "\u{64B}", DiacriticType.Fathatan)
        addItem(UnicodeType.Dammatan, "\u{64C}", DiacriticType.Dammatan)
        addItem(UnicodeType.Kasratan, "\u{64D}", DiacriticType.Kasratan)
        addItem(UnicodeType.Fatha, "\u{64E}", DiacriticType.Fatha)
        addItem(UnicodeType.Damma, "\u{64F}", DiacriticType.Damma)
        addItem(UnicodeType.Kasra, "\u{650}", DiacriticType.Kasra)
        addItem(UnicodeType.Shadda, "\u{651}", DiacriticType.Shadda)
        addItem(UnicodeType.Sukun, "\u{652}", DiacriticType.Sukun)
        addItem(UnicodeType.Maddah, "\u{653}", DiacriticType.Maddah)
        addItem(UnicodeType.HamzaAbove, "\u{654}", DiacriticType.HamzaAbove)
        addItem(UnicodeType.AlifKhanjareeya, "\u{670}", CharacterType.Alif, DiacriticType.AlifKhanjareeya)
        addItem(UnicodeType.AlifWithHamzatWasl, "\u{671}", CharacterType.Alif, DiacriticType.HamzatWasl)
        addItem(UnicodeType.SmallHighSeen, "\u{6DC}", CharacterType.SmallHighSeen)
        addItem(UnicodeType.SmallHighRoundedZero, "\u{6DF}", CharacterType.SmallHighRoundedZero)
        addItem(UnicodeType.SmallHighUprightRectangularZero,
                "\u{6E0}",
                CharacterType.SmallHighUprightRectangularZero)
        addItem(UnicodeType.SmallHighMeemIsolatedForm, "\u{6E2}", CharacterType.SmallHighMeemIsolatedForm)
        addItem(UnicodeType.SmallLowSeen, "\u{6E3}", CharacterType.SmallLowSeen)
        addItem(UnicodeType.SmallWaw, "\u{6E5}", CharacterType.SmallWaw)
        addItem(UnicodeType.SmallYa, "\u{6E6}", CharacterType.SmallYa)
        addItem(UnicodeType.SmallHighNoon, "\u{6E8}", CharacterType.SmallHighNoon)
        addItem(UnicodeType.EmptyCentreLowStop, "\u{6EA}", CharacterType.EmptyCentreLowStop)
        addItem(UnicodeType.EmptyCentreHighStop, "\u{6EB}", CharacterType.EmptyCentreHighStop)
        addItem(UnicodeType.RoundedHighStopWithFilledCentre,
                "\u{6EC}",
                CharacterType.RoundedHighStopWithFilledCentre)
        addItem(UnicodeType.SmallLowMeem, "\u{6ED}", CharacterType.SmallLowMeem)
    }
}
