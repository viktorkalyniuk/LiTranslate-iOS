//
//  LanguagesSelection.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 15.08.2022.
//

import Foundation
import AVFoundation

class LanguagesSelection: ObservableObject {
    @Published var input: Languages = .uk
    @Published var output: Languages = .en
}
