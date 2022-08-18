//
//  OutputTranslationView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct OutputTranslationView: View {
    @EnvironmentObject var selection: LanguagesSelection
    @EnvironmentObject var textData: TextData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TextEditor(text: .constant(textData.output))
                Button {
                    //TODO: Write logic for saving translation.
                } label: {
                    Image(systemName: SystemNames.star)
                }
                .padding([.top, .trailing])
            }
            OutputBottomButtons(language: selection, text: textData)
        }
        .padding()
    }
}

struct OutputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        OutputTranslationView()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
