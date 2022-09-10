//
//  LanguagesSelection.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 15.08.2022.
//

import Foundation
import SwiftUI

class LanguagesSelection: ObservableObject {
    @AppStorage(Keys.languageInputSelection) var input: Languages = .uk
    @AppStorage(Keys.languageOutputSelection) var output: Languages = .en
}
