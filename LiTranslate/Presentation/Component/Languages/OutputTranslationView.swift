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
    @EnvironmentObject var bookmarksData: BookmarksData

    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TextEditor(text: .constant(textData.output))
                    .padding()
                Button {
                    let bookmark = BookmarkModel(
                        inputLanguage:
                            selection.input,
                        outputLanguage:
                            selection.output,
                        inputText:
                            textData.input,
                        outputText:
                            textData.output
                    )
                    bookmarksData
                        .array
                        .insert(bookmark, at: 0)
                } label: {
                    Image(systemName: SystemNames.bookmark)
                }
                .opacity(Double(textData.output.isEmpty ? Numbers.zero : Numbers.one))
                .disabled(textData.output.isEmpty)
                .padding([.top, .trailing])
            }
            OutputBottomButtons()
        }
//        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(CGFloat(Numbers.twentyFive))
    }
}

struct OutputTranslationView_Previews: PreviewProvider {
    static var previews: some View {
        OutputTranslationView()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
    }
}
