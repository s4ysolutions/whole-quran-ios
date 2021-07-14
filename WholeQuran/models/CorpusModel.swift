//
//  CorpusModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol CorpusModel: CollectionSearchable where
    Element: CorpusWordEntryModel,
    KeyType == String {
}

extension CorpusModel {
    func by(_ surah: Int, _ ayah: Int, _ word: Int) -> Self.Element? {
        return by(key: "\(surah):\(ayah):\(word)")
    }
}
