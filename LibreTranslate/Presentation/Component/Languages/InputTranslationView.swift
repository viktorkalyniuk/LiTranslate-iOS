//
//  InputTranslationView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct InputTranslationView: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData

    var body: some View {
        VStack(alignment: .leading) {
            ChooseLanguagesView(selection: selection, textData: textData)
            HStack(alignment: .top) {
                TextEditor(text: $textData.input)
                    .onChange(of: textData.input) { _ in
                        TranslationParsing
                            .parse(text: textData.input,
                                   inputLanguage: selection.input,
                                   outputLanguage: selection.output) { data in
                                DispatchQueue.main.async {
                                    textData.output = data.translatedText
                                }
                            }
                    }
                Button {
                    textData.input = ""
                } label: {
                    Image(systemName: SystemNames.closeCircleFill)
                }
                .opacity(Double(textData.input.isEmpty ? Numbers.zero : Numbers.one))
                .padding([.top, .trailing])
            }
            HStack() {
                Button {
                    SpeechSynthesis.play(textData.input, language: selection.input)
                } label: {
                    Image(systemName: SystemNames.speakerWave2)
                            .padding()
                }
                .disabled(!SpeechSynthesis.canSynthesis(language: selection.input))
            }
        }
        .padding()
    }
}

struct InputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        InputTranslationView()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
