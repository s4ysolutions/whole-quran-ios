//
//  Ayah.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

protocol AyahWordModel {
    var word: String { get }
    var no: Int { get }
}
protocol AyahModel {
    associatedtype AyahWordsType: CollectionOneBased where AyahWordsType.Element == AyahWordModel
    var no: Int { get }
    var arabic: AyahWordsType {get}
}
