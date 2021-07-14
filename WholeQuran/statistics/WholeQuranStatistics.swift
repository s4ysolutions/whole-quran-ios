//
//  WholeQuranStatistics.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

struct WholeQuranStatistics<SurahsPivot: SurahsPivotModel, Corpus: CorpusModel, CorpusPivot: CorpusPivotModel> {
    private let surahPivot: SurahsPivot
    private let wordSearch: WordSearch<Corpus, CorpusPivot>

    @inlinable
    var totalDistinctWords: Int {
        return surahPivot.count
    }

    lazy var totalWords: Int = {
        var count = 0
        for entry in surahPivot {
            count += entry.positions.count
        }
        return count
    }()

    func occurring(word: String) -> Int {
        let result = wordSearch.search(sample: word, searchConsonant: false)
        var count = 0
        for match in result.exact {
            count += match.indexes.count
        }
        for match in result.form {
            count += match.indexes.count
        }
        for match in result.lem {
            count += match.indexes.count
        }
        return count
    }
}
