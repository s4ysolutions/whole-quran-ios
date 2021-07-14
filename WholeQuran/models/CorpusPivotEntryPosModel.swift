//
//  CorpusPivotEntryPosModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol CorpusPivotEntryPosModel {
    var surah: Int { get }
    var ayah: Int { get }
    var word: Int { get }
    var part: Int { get }
}
