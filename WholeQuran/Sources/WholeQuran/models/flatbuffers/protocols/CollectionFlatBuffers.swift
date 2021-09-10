//
//  CollectionFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 10.07.2021.
//

import Foundation
import UIKit
import FlatBuffers

protocol CollectionFlatBuffers: CollectionInt {
    associatedtype ProviderType: FlatBuffersCollecitonProvider
    var provider: ProviderType { get }
   // subscript(position: Self.Index) -> ProviderType.ModelType {get}
}
