//
//  InputBottomButtons.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct InputBottomButtons: View {
    @ObservedObject var language: LanguagesSelection
    @ObservedObject var text: TextData

    var body: some View {
        HStack() {
            Button {
                SpeechSynthesis.play(text.input, language: language.input)
            } label: {
                Image(systemName: SystemNames.speakerWave2)
                    .padding()
            }
            .disabled(!SpeechSynthesis.canSynthesis(language: language.input))

            Spacer()
            ScanButton(text: $text.input)
                .fixedSize(horizontal: true, vertical: true)
                .padding(.trailing)
        }
    }
}

struct InputBottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        InputBottomButtons(language: LanguagesSelection(), text: TextData())
    }
}
