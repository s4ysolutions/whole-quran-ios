//
//  HavingAt.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 10.07.2021.
//

import Foundation

protocol FlatBuffersCollecitonProvider {
    associatedtype FlatBuffersType
    associatedtype ModelType
    var root: FlatBuffersType { get }
    subscript(positions: Int32) -> ModelType { get }
    var count: Int32 { get }
}
