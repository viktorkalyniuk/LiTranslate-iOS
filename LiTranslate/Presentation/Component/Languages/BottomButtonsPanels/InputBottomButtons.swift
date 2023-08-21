//
//  InputBottomButtons.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct InputBottomButtons: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData
    @EnvironmentObject private var instance: InstanceURL

    @Binding var isKeyboardVisible: Bool

    private let translateButtonFontSize: CGFloat = CGFloat(Numbers.fourteen)

    private let synthesize = SpeechSynthesis()

    var body: some View {
        HStack() {
            Button {
                synthesize.play(textData.input, language: selection.input)
            } label: {
                Image(systemName: SystemNames.speakerWave2)
                    .padding()
            }
            .disabled(!synthesize.canSynthesis(language: selection.input))
            Button {
                UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
            } label: {
                Image(systemName: SystemNames.keyboardChevronDown)
            }
            .disabled(!isKeyboardVisible)
            .opacity(
                Double(!isKeyboardVisible ?
                       Numbers.zero : Numbers.one))
            Spacer()
            Button {
                TranslationParsing
                            .parse(url: instance.getURL(),
                                   text: textData.input,
                                   inputLanguage: selection.input,
                                   outputLanguage: selection.output,
                                   key: instance.getKey()
                            ) { data in
                                        DispatchQueue.main.async {
                                            textData.output = data.translatedText
                                        }
                            }
                UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
            } label: {
                Text("Translate")
                    .font(.system(size: translateButtonFontSize))
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(uiColor: .systemBlue))
            .disabled(textData.input.isEmpty)
            .opacity(textData.input.isEmpty ? Double(Numbers.zero) : Double(Numbers.one))
            Spacer()
            Button {
                if let string = UIPasteboard.general.string {
                    textData.input = string
                }
            } label: {
                Image(systemName: SystemNames.onClipboard)
            }
            .padding()
            ScanButton(text: $textData.input)
                .fixedSize(horizontal: true, vertical: true)
        }
        .padding(.trailing)
    }
}

struct InputBottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        InputBottomButtons(isKeyboardVisible: .constant(true))
            .environmentObject(TextData())
            .environmentObject(LanguagesSelection())
    }
}
