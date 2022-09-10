//
//  OutputBottomButtons.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct OutputBottomButtons: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData

    @State private var isSharePresented: Bool = false
    
    var body: some View {
        HStack() {
            Button {
                SpeechSynthesis.play(textData.output, language: selection.output)
            } label: {
                Image(systemName: SystemNames.speakerWave2)
                    .padding()
            }
            .disabled(!SpeechSynthesis.canSynthesis(language: selection.output))
            Spacer()
            Button {
                UIPasteboard.general.string = textData.output
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
                ActivityViewController(activityItems: [textData.output])
            }
            .disabled(textData.output.isEmpty)
        }
        .padding(.trailing)
    }
}

struct OutputBottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        OutputBottomButtons()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
