//
//  SurahModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

protocol SurahModel {
    associatedtype Ayah: AyahModel
    associatedtype Ayahs: Collection where Ayahs.Element == Ayah, Ayahs.Index == Int
    var no: Int { get }
    var title: SurahTitleModel { get }
    var ayahs: Ayahs { get }
}
