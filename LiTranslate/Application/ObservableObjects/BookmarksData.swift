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

    func isDataInArray(bookmarkModel: BookmarkModel) -> Bool {
        for model in array {
            if model == bookmarkModel {
                return true
            }
        }
        return false
    }

    func removeDataInArray(bookmarkModel: BookmarkModel) {
        if let index = array.firstIndex(of: bookmarkModel) {
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
