//
//  TextData.swift
//  LiTranslate
//
//  Created by vktr on 16.08.2022.
//

import Foundation

class TextData: ObservableObject {
    @Published var input: String = ""
    @Published var output: String = ""
}
