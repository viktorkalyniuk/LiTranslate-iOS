//
//  TextData.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 16.08.2022.
//

import Foundation

class TextData: ObservableObject {
    @Published var input: String = ""
    @Published var output: String = ""
}
