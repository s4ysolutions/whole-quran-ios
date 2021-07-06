//
//  FlatBuffersData.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation
import UIKit

class FlatBuffersData {
    static func get(dataAsset name: String)-> Data {
        let d = NSDataAsset(name: name, bundle: Bundle(for: self))
        return d!.data
    }
}
