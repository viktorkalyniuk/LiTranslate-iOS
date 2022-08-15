//
//  InputTranslationView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct InputTranslationView: View {
    @EnvironmentObject var selection: LanguagesSelection
    @State private var input: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            ChooseLanguagesView(selection: selection)
            HStack(alignment: .top) {
                TextEditor(text: $input)
                Button {
                    input = ""
                } label: {
                    Image(systemName: SystemNames.closeCircleFill)
                }
                .opacity(Double(input.isEmpty ? Numbers.zero : Numbers.one))
                .padding([.top, .trailing])
            }
            HStack() {
                Button {
                    SpeechSynthesis.play(input, language: selection.input)
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
    }
}
