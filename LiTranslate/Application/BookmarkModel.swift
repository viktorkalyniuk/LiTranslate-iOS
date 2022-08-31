//
//  BookmarkModel.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import Foundation

struct BookmarkModel: Codable, Hashable {    
    var inputLanguage: Languages
    var outputLanguage: Languages

    var inputText: String
    var outputText: String

    static func getTestModel() -> BookmarkModel {
        return BookmarkModel(inputLanguage: .en,
                             outputLanguage: .fr,
                             inputText: "Hello",
                             outputText: "Bonjour")
    }

    func assignTo(selection: LanguagesSelection, textData: TextData) {
        selection.output = self.outputLanguage
        selection.input = self.inputLanguage
        textData.output = self.outputText
        textData.input = self.inputText
    }
}
