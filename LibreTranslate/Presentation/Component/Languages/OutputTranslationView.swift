//
//  OutputTranslationView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct OutputTranslationView: View {
    @EnvironmentObject var selection: LanguagesSelection
    @State private var output: String = "Placeholder"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TextEditor(text: $output)
                Button {
                    //TODO: Write logic for saving translation.
                } label: {
                    Image(systemName: SystemNames.star)
                }
                .padding([.top, .trailing])
            }
            HStack() {
                Button {
                    SpeechSynthesis.play(output, language: selection.output)
                } label: {
                    Image(systemName: SystemNames.speakerWave2)
                        .padding()
                }
                .disabled(!SpeechSynthesis.canSynthesis(language: selection.output))
            }
        }
        .padding()
    }
}

struct OutputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        OutputTranslationView()
    }
}
