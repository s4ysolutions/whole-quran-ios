//
//  SurahsPivotWordEntryModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol SurahsPivotWordEntryModel {
    associatedtype SurahsPivotWordPositionsType: CollectionZeroBased
    where SurahsPivotWordPositionsType.Element: SurahsPivotWordPosModel

    var word: String { get }
    var positions: SurahsPivotWordPositionsType { get }
}
