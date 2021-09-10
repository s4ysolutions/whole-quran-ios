//
//  String+removeAlefAndSuch.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

extension String {
    func removeAlefAndSuch() -> String {
        return replacingOccurrences(of: " ء ", with: "")
            .replacingOccurrences(of: "ء", with: "")
            .replacingOccurrences(of: "ـ", with: "")
            .replacingOccurrences(of: "_", with: "")
            .replacingOccurrences(of: "ۜ", with: "")
            .replacingOccurrences(of: "ۦ", with: "")
            .replacingOccurrences(of: "ۢ", with: "")
            .replacingOccurrences(of: "ٱ", with: "ا")
            .replacingOccurrences(of: "أ", with: "ا")
            .replacingOccurrences(of: "آ", with: "ا")
            .replacingOccurrences(of: "ۥ", with: "")
            .replacingOccurrences(of: "ى", with: "")
            .replacingOccurrences(of: "ئ", with: "")
            .replacingOccurrences(of: "ىۦ", with: "")
            .replacingOccurrences(of: "ٌ", with: "")
            .replacingOccurrences(of: "ٌ", with: "")
    }
}
