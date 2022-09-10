//
//  Links.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 16.08.2022.
//

import Foundation

struct Links {
    enum LibreTranslateMirrors: String, CaseIterable, Identifiable, Equatable {
        var id: String { self.rawValue }

        case de = "https://libretranslate.de/translate"
        case argosopentech = "https://translate.argosopentech.com/translate"
//        case skitzen = "https://translate.api.skitzen.com/translate"
        case fortytwo = "https://translate.fortytwo-it.com/translate"
        case terraprint = "https://translate.terraprint.co/translate"
        case vern = "https://lt.vern.cc/translate"
    }

    struct Info {
        static let saveUkraine: String = "https://stand-with-ukraine.pp.ua/"
        static let libreTranslateHosting: String = "https://github.com/LibreTranslate/LibreTranslate#install-and-run"
        static let sourceCode: String = "https://github.com/viktorkalyniuk/LiTranslate-iOS"
        static let license: String = "https://www.gnu.org/licenses/agpl-3.0.en.html"
        static let privacy: String = "https://github.com/viktorkalyniuk/LiTranslate-iOS/blob/dev/PRIVACY.md"
        static let liTranslateAppStore: String = "https://apps.apple.com/us/app/litranslate/id1644385339"
    }
}
