//
//  ChooseLanguagesView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct ChooseLanguagesView: View {
    @ObservedObject var language: LanguagesSelection
    @ObservedObject var text: TextData

    @EnvironmentObject private var instance: InstanceURL
    
    var body: some View {
        HStack {
            Picker(selection: $language.input, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.getCountryName()).tag(language)
                }
            }
            Spacer()
            Button {
                (language.input, language.output) = (language.output, language.input)
                TranslationParsing
                    .parse(url: instance.getURL(),
                           text: text.input,
                           inputLanguage: language.input,
                           outputLanguage: language.output) { data in
                        DispatchQueue.main.async {
                            text.output = data.translatedText
                        }
                    }
            } label: {
                Image(systemName: SystemNames.swap)
                    .rotationEffect(.degrees(-Double(Numbers.ninety)))
            }
            Spacer()
            Picker(selection: $language.output, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.getCountryName()).tag(language)
                }
            }
            .onChange(of: language.output) { newValue in
                TranslationParsing
                    .parse(url: instance.getURL(),
                           text: text.input,
                           inputLanguage: language.input,
                           outputLanguage: language.output) { data in
                        DispatchQueue.main.async {
                            text.output = data.translatedText
                        }
                    }
            }
        }
        .foregroundColor(Color(uiColor: .systemGray6))
        .padding(.horizontal)
    }
}

struct ChooseLanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguagesView(language: LanguagesSelection(), text: TextData())
    }
}
