//
//  AyahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation

struct AyahModelFlatBuffers: AyahModel {
    typealias Words = WordsFlatBuffers

    let root: com_quranic_wholequran_fbs_Ayah
    
    var no: Int {
        get {
            return Int(root.no)
        }
    }

    struct WordsFlatBuffers: Collection {
        let root: com_quranic_wholequran_fbs_Ayah
        
        func index(after i: Int) -> Int {
            return i + 1
        }
        
        subscript(position: Int) -> String {
            get {
                return root.words(at: Int32(position - 1)) ?? ""
            }
        }
        
        var startIndex: Int = 1
        var endIndex: Int
        init(root theRoot: com_quranic_wholequran_fbs_Ayah) {
            root = theRoot
            endIndex = Int(root.wordsCount) + 1
        }
    }
    
    var arabic: Words {
        get {
            return Words(root: root)
        }
    }
    
}
