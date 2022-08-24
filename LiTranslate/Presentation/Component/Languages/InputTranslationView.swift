//
//  InputTranslationView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct InputTranslationView: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            ChooseLanguagesView()
                .padding()
                .background(Color(uiColor: .systemBlue).ignoresSafeArea())
            HStack(alignment: .top) {
                TextEditor(text: $textData.input)
                    .padding([.leading, .trailing, .bottom])
                Button {
                    textData.input = ""
                    textData.output = ""
                } label: {
                    Image(systemName: SystemNames.closeCircleFill)
                }
                .opacity(
                    Double(textData.input.isEmpty ?
                           Numbers.zero : Numbers.one))
                .padding([.top, .trailing])
            }
            InputBottomButtons()
        }
//        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(CGFloat(Numbers.twentyFive))
    }
}

struct InputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        InputTranslationView()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
