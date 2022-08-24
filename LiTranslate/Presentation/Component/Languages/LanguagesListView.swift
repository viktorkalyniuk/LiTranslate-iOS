//
//  LanguagesListView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 23.08.2022.
//

import SwiftUI

struct LanguagesListView: View {
    var textMethod: TextMethod

    @ObservedObject var languages: LanguagesSelection

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        List(Languages.allCases, id: \.self) { language in
            Button {
                switch textMethod {
                case .input:
                    languages.input = language
                case .output:
                    languages.output = language
                }
                self.mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    FlagImageView(language: .constant(language), color: Color(uiColor: .secondarySystemBackground))
                    Text(language.getCountryName())
                }
            }
        }
    }
}

struct LanguagesListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesListView(textMethod: .input, languages: LanguagesSelection())
    }
}
