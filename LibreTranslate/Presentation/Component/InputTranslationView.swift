//
//  InputTranslationView.swift
//  LibreTranslate
//
//  Created by vktr on 13.08.2022.
//

import SwiftUI

struct InputTranslationView: View {
    @State private var input: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            ChooseLanguagesView()
            HStack(alignment: .top) {
                TextEditor(text: $input)
                Button {
                    input = ""
                } label: {
                    Image(systemName: SystemNames.closeCircleFill)
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

struct InputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        InputTranslationView()
    }
}
