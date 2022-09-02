//
//  Colors.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 02.09.2022.
//

import Foundation
import SwiftUI

struct Colors {
    struct UIColors {
        struct Background {
            static let main: UIColor = .systemGray5
            static let primary: UIColor = .systemGray6
            static let chooseLanguageView: UIColor = .systemBlue
        }

        struct Foreground {
            static let label: UIColor = .label
            static let secondaryLabel: UIColor = .secondaryLabel
            static let tertiaryLabel: UIColor = .tertiaryLabel
            static let primaryButton: UIColor = .systemBlue
        }
    }

    struct Background {
        static let mainView: Color = Color(uiColor: UIColors.Background.main)
        static let primaryView: Color = Color(uiColor: UIColors.Background.primary)
        static let chooseLanguageView: Color = Color(uiColor: UIColors.Background.chooseLanguageView)
    }

    struct Foreground {
        static let label: Color = Color(uiColor: UIColors.Foreground.label)
        static let secondaryLabel: Color = Color(uiColor: UIColors.Foreground.secondaryLabel)
        static let tertiaryLabel: Color = Color(uiColor: UIColors.Foreground.tertiaryLabel)
        static let primaryButton: Color = Color(uiColor: UIColors.Foreground.primaryButton)
        static let chooseLanguageView: Color = Color.white
    }
}
