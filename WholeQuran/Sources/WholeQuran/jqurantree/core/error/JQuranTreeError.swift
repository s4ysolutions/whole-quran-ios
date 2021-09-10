//
//  JQuranTreeError.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 12.07.2021.
//

import Foundation

struct JQuranTreeError: Error {
    let message: String
    init (error: JQuranTreeErrors) {
        message = error.rawValue
    }
}
