//
//  Localizable.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 09.07.2021.
//

import Foundation

protocol Localizable {
    var locale: String { get }
    var defaultLocale: String { get }
}
