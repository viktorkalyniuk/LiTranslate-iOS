//
//  BookmarksOperator.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 27.08.2022.
//

import Foundation

struct BookmarksOperator {
    var selection: LanguagesSelection
    var textData: TextData

    func createModel() -> BookmarkModel {
        return BookmarkModel(inputLanguage: selection.input,
                             outputLanguage: selection.output,
                             inputText: textData.input,
                             outputText: textData.output)
    }
}
