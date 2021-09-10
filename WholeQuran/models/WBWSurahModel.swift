//
//  WBWSurahModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//

import Foundation

protocol WBWSurahModel: CollectionZeroBased where
    Element: WBWEntryModel {
    func by(ayah: Int, word: Int) -> Self.Element?
    func by(surah: Int, ayah: Int, word: Int) -> Self.Element?
    func by(key: String) -> Self.Element?
}
