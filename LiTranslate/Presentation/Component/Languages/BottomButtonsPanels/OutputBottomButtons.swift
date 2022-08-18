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

    @State private var isSharePresented: Bool = false
    
    var body: some View {
        HStack() {
            Button {
                SpeechSynthesis.play(text.output, language: language.output)
            } label: {
                Image(systemName: SystemNames.speakerWave2)
                    .padding()
            }
            .disabled(!SpeechSynthesis.canSynthesis(language: language.output))
            Spacer()
            Button {
                UIPasteboard.general.string = text.output
            } label: {
                Image(systemName: SystemNames.docOnDoc)
            }
            .padding()
            Button {
                isSharePresented = true
            } label: {
                Image(systemName: SystemNames.share)
            }
            .sheet(isPresented: $isSharePresented) {
                ActivityViewController(activityItems: [text.output])
            }
            .disabled(text.output.isEmpty)
            .padding(.trailing)
        }
    }
}

struct OutputBottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        OutputBottomButtons(language: LanguagesSelection(), text: TextData())
    }
}
