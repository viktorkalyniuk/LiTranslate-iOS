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
