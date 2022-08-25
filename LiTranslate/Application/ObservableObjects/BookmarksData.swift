//
//  BookmarksData.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import Foundation

class BookmarksData: ObservableObject {
    @Published var array = [BookmarkModel]() {
        didSet {
            save(array: array)
        }
    }

    init() {
        array = getArray()
    }

    func isDataInArray(selection: LanguagesSelection, textData: TextData) -> Bool {
        for model in array {
            if model.inputLanguage == selection.input &&
                model.outputLanguage == selection.output &&
                model.inputText == textData.input &&
                model.outputText == textData.output {
                return true
            }
        }
        return false
    }

    func removeDataInArray(selection: LanguagesSelection, textData: TextData) {
        let bookmark: BookmarkModel = BookmarkModel(inputLanguage: selection.input,
                                                    outputLanguage: selection.output,
                                                    inputText: textData.input,
                                                    outputText: textData.output)

        if let index = array.firstIndex(of: bookmark) {
            array.remove(at: index)
        }
    }

    private func getArray() -> [BookmarkModel] {
        if let savedData = UserDefaults.standard.data(forKey: Keys.bookmarks) {
            if let decodedArray = try? JSONDecoder().decode([BookmarkModel].self, from: savedData) {
                return decodedArray
            }
        }
        return []
    }

    private func save(array: [BookmarkModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaults.standard.set(encoded, forKey: Keys.bookmarks)
        }
    }
}
