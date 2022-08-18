//
//  OutputBottomButtons.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct OutputBottomButtons: View {
    @ObservedObject var language: LanguagesSelection
    @ObservedObject var text: TextData
    
    var body: some View {
        HStack() {
            Button {
                SpeechSynthesis.play(text.output, language: language.output)
            } label: {
                Image(systemName: SystemNames.speakerWave2)
                    .padding()
            }
            .disabled(!SpeechSynthesis.canSynthesis(language: language.output))
        }
    }
}

struct OutputBottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        OutputBottomButtons(language: LanguagesSelection(), text: TextData())
    }
}
