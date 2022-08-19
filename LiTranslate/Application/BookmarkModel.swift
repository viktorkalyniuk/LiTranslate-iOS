//
//  BookmarkModel.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import Foundation

struct BookmarkModel: Codable, Hashable {    
    var inputLanguage: String
    var outputLanguage: String

    var inputText: String
    var outputText: String
}
