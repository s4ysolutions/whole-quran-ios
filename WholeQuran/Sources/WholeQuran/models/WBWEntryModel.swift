//
//  WBWModel.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.09.2021.
//
import Foundation

public protocol WBWEntryModel {
    var id: String { get }
    var transliteration: String { get }
    var meaning: String { get }
}
