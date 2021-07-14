//
//  SurahsPivotModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol SurahsPivotModel: CollectionSearchable where Element: SurahsPivotWordEntryModel, KeyType == String {
}
