//
//  LanguageView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 01.09.2022.
//

import SwiftUI

struct LanguageView: View {
    @State var language: Languages
    @State var flagBorderColor: Color

    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                HStack {
                    FlagImageView(language: $language, color: flagBorderColor)
                    Text(language.getCountryName())
                }
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(language: .uk, flagBorderColor: Colors.Background.mainView)
    }
}
