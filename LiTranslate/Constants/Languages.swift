//
//  Languages.swift
//  LiTranslate
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

    func getCountryName() -> String {
        var countryName = "unknown"

        switch self {
        case .en:
            countryName = "English"
        case .uk:
            countryName = "Ukrainian"
        case .ar:
            countryName = "Arabic"
        case .az:
            countryName = "Azerbaijani"
        case .zh:
            countryName = "Chinese"
        case .cs:
            countryName = "Czech"
        case .da:
            countryName = "Danish"
        case .nl:
            countryName = "Dutch"
        case .eo:
            countryName = "Esperanto"
        case .fi:
            countryName = "Finnish"
        case .fr:
            countryName = "French"
        case .de:
            countryName = "German"
        case .el:
            countryName = "Greek"
        case .he:
            countryName = "Hebrew"
        case .hi:
            countryName = "Hindi"
        case .hu:
            countryName = "Hungarian"
        case .id:
            countryName = "Indonesian"
        case .ga:
            countryName = "Irish"
        case .it:
            countryName = "Italian"
        case .ja:
            countryName = "Japanese"
        case .ko:
            countryName = "Korean"
        case .fa:
            countryName = "Persian"
        case .pl:
            countryName = "Polish"
        case .pt:
            countryName = "Portuguese"
        case .sk:
            countryName = "Slovak"
        case .es:
            countryName = "Spanish"
        case .sv:
            countryName = "Swedish"
        case .tr:
            countryName = "Turkish"
        }

        return countryName
    }
}
