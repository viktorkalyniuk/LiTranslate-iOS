//
//  ChooseLanguagesView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct ChooseLanguagesView: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData
    @EnvironmentObject private var instance: InstanceURL
    
    var body: some View {
        HStack {
            NavigationLink {
                LanguagesListView(languages: selection, textMethod: .input)
            } label: {
                FlagImageView(language: $selection.input, color: Color(uiColor: .systemBlue))
                Text(selection.input.getCountryName())
            }
            Spacer()
            Button {
                (selection.input, selection.output) = (selection.output, selection.input)
                TranslationParsing
                    .parse(url: instance.getURL(),
                           text: textData.input,
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
            NavigationLink {
                LanguagesListView(languages: selection, textMethod: .output)
            } label: {
                Text(selection.output.getCountryName())
                FlagImageView(language: $selection.output, color: Color(uiColor: .systemBlue))
            }
            .onChange(of: selection.output) { newValue in
                TranslationParsing
                    .parse(url: instance.getURL(),
                           text: textData.input,
                           inputLanguage: selection.input,
                           outputLanguage: selection.output) { data in
                        DispatchQueue.main.async {
                            textData.output = data.translatedText
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
        ChooseLanguagesView()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
