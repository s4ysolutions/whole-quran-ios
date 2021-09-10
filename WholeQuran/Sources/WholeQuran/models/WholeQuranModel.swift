//
//  WholeQuran.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

protocol WholeQuranModel {
    associatedtype SurahTitlesType: SurahTitlesModel
    associatedtype SurahsType: SurahsModel
    associatedtype SurahsPivotType: SurahsPivotModel
    associatedtype CorpusType: CorpusModel
    associatedtype CorpusPivotType: CorpusPivotModel
    var surahTitles: SurahTitlesType { get }
    var surahs: SurahsType {get}
    var surahsPivot: SurahsPivotType {get}
    var corpus: CorpusType {get}
    var corpusPivot: CorpusPivotType {get}
}
