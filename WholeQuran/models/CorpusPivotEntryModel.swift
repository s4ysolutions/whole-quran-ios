//
//  CorpusPivotEntryModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol CorpusPivotEntryModel {
    associatedtype CorpusPivotEntryPositionsType: CollectionZeroBased where
        CorpusPivotEntryPositionsType.Element: CorpusPivotEntryPosModel

    var id: String { get }
    var positions: CorpusPivotEntryPositionsType { get }
}
