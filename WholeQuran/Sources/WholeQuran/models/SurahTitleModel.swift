//
//  SurahTitle.swift
//  whole-quran-demo
//
//  Created by  Sergey Dolin on 04.07.2021.
//

import Foundation

public protocol SurahTitleModel {
    var no: Int { get }
    var arabic: String { get }
    var translit: String { get }
    var localize: String { get }
}
