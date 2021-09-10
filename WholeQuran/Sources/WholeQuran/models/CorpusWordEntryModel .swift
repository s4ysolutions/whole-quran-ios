//
//  CorpusWordEntryModel .swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 07.07.2021.
//

import Foundation

public protocol CorpusWordEntryModel {
    associatedtype PartEntriesType: CollectionOneBased where
        PartEntriesType.Element: CorpusPartEntryModel

    var index: String { get }
    var parts: PartEntriesType { get }
}

extension CorpusWordEntryModel {
    var position: (Int, Int, Int) {
        let indexes = index.split(separator: ":").map { i in Int(i) }
        return (indexes[0]!, indexes[1]!, indexes[2]!)
    }

    var buckwalter: String {
        var buckwalter = ""
        for part in parts {
            buckwalter += part.form
        }
        return buckwalter
    }
}
