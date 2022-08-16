//
//  Languages.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import Foundation

enum Languages: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }

    case en = "en"
    case uk = "uk"
    case ar = "ar"
    case az = "az"
    case zh = "zh"
    case cs = "cs"
    case da = "da"
    case nl = "nl"
    case eo = "eo"
    case fi = "fi"
    case fr = "fr"
    case de = "de"
    case el = "el"
    case he = "he"
    case hi = "hi"
    case hu = "hu"
    case id = "id"
    case ga = "ga"
    case it = "it"
    case ja = "ja"
    case ko = "ko"
    case fa = "fa"
    case pl = "pl"
    case pt = "pt"
    case sk = "sk"
    case es = "es"
    case sv = "sv"
    case tr = "tr"
}
