//
//  CorpusPivotModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol CorpusPivotModel {
    associatedtype CorpusPivotEntriesType: CollectionSearchable where
        CorpusPivotEntriesType.Element: CorpusPivotEntryModel,
        CorpusPivotEntriesType.KeyType == String

    var exact: CorpusPivotEntriesType { get }
    var lem: CorpusPivotEntriesType { get }
    var lemc: CorpusPivotEntriesType { get }
    var form: CorpusPivotEntriesType { get }
    var formc: CorpusPivotEntriesType { get }
    var consonant: CorpusPivotEntriesType { get }
}
