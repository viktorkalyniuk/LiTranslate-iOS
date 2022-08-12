//
//  Languages.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import Foundation

enum Languages: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }

    case uk = "UK"
    case en = "EN"
}
