//
//  WBWSurahModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//

import Foundation

protocol WBWSurahModel: CollectionSearchable where
    Element: WBWEntryModel,
    KeyType == String {
}
