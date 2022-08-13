//
//  OutputTranslationView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct OutputTranslationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TextEditor(text: .constant("Placeholder"))
                Button {
                    //TODO: Write logic for saving translation.
                } label: {
                    Image(systemName: SystemNames.star)
                }
                .padding([.top, .trailing])
            }
            HStack() {
                Button {
                    //TODO: Write logic for speech synthesizer.
                } label: {
                    Image(systemName: SystemNames.speakerWave2)
                        .padding()
                }
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
