//
//  RecentlyUsedLanguages.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 02.09.2022.
//

import Foundation
import SwiftUI

class RecentlyUsedLanguages: ObservableObject {
    @Published var array = [Languages]() {
        didSet {
            save(array: array)
        }
    }

    init() {
        array = getArray()
    }

    func append(language: Languages) {
        if !array.contains(language) {
            if array.count == Numbers.six {
                array.removeLast()
            }
            array.insert(language, at: Numbers.zero)
        }
    }

    func getArray() -> [Languages] {
        if let savedData = UserDefaults.standard.data(forKey: Keys.recentlyUsedLanguages) {
            if let decodedArray = try? JSONDecoder().decode([Languages].self, from: savedData) {
                return decodedArray
            }
        }
        return []
    }

    func save(array: [Languages]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaults.standard.set(encoded, forKey: Keys.recentlyUsedLanguages)
        }
    }
}
