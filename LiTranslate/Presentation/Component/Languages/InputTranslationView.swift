//
//  InputTranslationView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import SwiftUI

struct InputTranslationView: View, KeyboardReadable {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData

    @State private var isKeyboardVisible: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            ChooseLanguagesView()
                .padding()
                .background(Colors.Background.chooseLanguageView.ignoresSafeArea())
            HStack(alignment: .top) {
                TextEditor(text: $textData.input)
                    .padding([.leading, .trailing])
                    .onReceive(keyboardPublisher) { isVisible in
                        isKeyboardVisible = isVisible
                    }
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
            InputBottomButtons(isKeyboardVisible: $isKeyboardVisible)
        }
//        .padding()
        .background(Colors.Background.primaryView)
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
