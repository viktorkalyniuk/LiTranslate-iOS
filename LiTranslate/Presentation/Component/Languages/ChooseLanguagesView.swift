//
//  ChooseLanguagesView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct ChooseLanguagesView: View {
    @ObservedObject var selection: LanguagesSelection
    @ObservedObject var textData: TextData

    var body: some View {
        HStack {
            Picker(selection: $selection.input, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            Spacer()
            Button {
                (selection.input, selection.output) = (selection.output, selection.input)
                TranslationParsing
                    .parse(text: textData.input,
                           inputLanguage: selection.input,
                           outputLanguage: selection.output) { data in
                        DispatchQueue.main.async {
                            textData.output = data.translatedText
                        }
                    }
            } label: {
                Image(systemName: SystemNames.swap)
                    .rotationEffect(.degrees(-Double(Numbers.ninety)))
            }
            Spacer()
            Picker(selection: $selection.output, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            .onChange(of: selection.output) { newValue in
                TranslationParsing
                    .parse(text: textData.input,
                           inputLanguage: selection.input,
                           outputLanguage: selection.output) { data in
                        DispatchQueue.main.async {
                            textData.output = data.translatedText
                        }
                    }
            }
        }
        .padding(.horizontal)
    }
}

struct ChooseLanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguagesView(selection: LanguagesSelection(), textData: TextData())
    }
}
