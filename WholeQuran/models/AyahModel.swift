//
//  Ayah.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

protocol AyahModel {
    associatedtype Words: Collection where Words.Element == String, Words.Index == Int
    var no: Int { get }
    var arabic: Words { get }
}
