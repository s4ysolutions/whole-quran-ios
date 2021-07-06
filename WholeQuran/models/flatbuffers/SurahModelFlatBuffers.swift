//
//  SurahModelFlatBuffers.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 06.07.2021.
//

import Foundation
import FlatBuffers

struct SurahModelFlatBuffers: SurahModel {
    typealias Ayah = AyahModelFlatBuffers
    typealias Ayahs = AyahsFlatBuffers
    
    let root: com_quranic_wholequran_fbs_Surah
    let title: SurahTitleModel
    var no: Int {
        get {
            Int(root.no)
        }
    }

    struct AyahsFlatBuffers: Collection {
        let root: com_quranic_wholequran_fbs_Surah
        
        func index(after i: Int) -> Int {
            return i + 1
        }
        
        subscript(position: Int) -> Ayah {
            return AyahModelFlatBuffers(root: root.ayahs(at: Int32(position - 1))!)
        }
        
        var startIndex: Int = 1
        var endIndex: Int
        init(root theRoot: com_quranic_wholequran_fbs_Surah) {
            root = theRoot
            endIndex = Int(root.ayahsCount) + 1
        }
    }
    
    var ayahs: Ayahs {
        get {
            return AyahsFlatBuffers(root: root)
        }
    }
    
    init(assetNo: Int, title theTitle: SurahTitleModel) {
        self.init(assetName: "surah_\(assetNo)", title: theTitle)
    }
    
    init(assetName: String, title theTitle: SurahTitleModel) {
        let data = FlatBuffersData.get(dataAsset: assetName)
        self.init(data: data, title: theTitle)
    }
    
    init(data: Data, title theTitle: SurahTitleModel) {
        let root = com_quranic_wholequran_fbs_Surah.getRootAsSurah(bb: ByteBuffer(data: data))
        self.init(root: root, title: theTitle)
    }
    
    init(root theRoot: com_quranic_wholequran_fbs_Surah, title theTitle: SurahTitleModel) {
        root = theRoot
        title = theTitle
    }
}
