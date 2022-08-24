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
}
