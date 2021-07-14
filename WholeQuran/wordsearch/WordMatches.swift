//
//  WordMatches.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

typealias WordIndex = String

protocol WordMatchedIndexes {
    var indexes: Set<WordIndex> { get }
}

enum WordMatches {
    struct Exact: WordMatchedIndexes {
        let matchedWord: String
        let indexes: Set<WordIndex>
    }

    struct Lem: WordMatchedIndexes {
        let matchedLem: String
        let indexes: Set<WordIndex>
    }

    struct Form: WordMatchedIndexes {
        let matchedForm: String
        let indexes: Set<WordIndex>
    }

    struct Consonants: WordMatchedIndexes {
        let matchedConsonants: String
        let indexes: Set<WordIndex>
    }

    case exact(Exact)
    case lem(Lem)
    case form(Form)
    case consonants(Consonants)
}

struct SearchResult {
    let word: String
    let exact: [WordMatches.Exact]
    let form: [WordMatches.Form]
    let lem: [WordMatches.Lem]
    let consonant: [WordMatches.Consonants]
}
