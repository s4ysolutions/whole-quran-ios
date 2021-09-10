//
//  SurahModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

public protocol SurahModel {
    associatedtype AyahsType: CollectionOneBased where AyahsType.Element: AyahModel
    var no: Int { get }
    var title: SurahTitleModel { get }
    var ayahs: AyahsType { get }
}
