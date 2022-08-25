//
//  BookmarkButton.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 25.08.2022.
//

import SwiftUI

struct BookmarkButton: View {
    @EnvironmentObject var selection: LanguagesSelection
    @EnvironmentObject var textData: TextData
    @EnvironmentObject var bookmarksData: BookmarksData
    
    var body: some View {
        Button {
            if bookmarksData.isDataInArray(
                selection: selection,
                textData: textData
            ) {
                bookmarksData.removeDataInArray(
                    selection: selection,
                    textData: textData
                )
            } else {
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
            }
        } label: {
            if bookmarksData.isDataInArray(selection: selection, textData: textData) {
                Image(systemName: SystemNames.bookmarkFill)
            } else {
                Image(systemName: SystemNames.bookmark)
            }
        }
        .opacity(Double(textData.output.isEmpty ? Numbers.zero : Numbers.one))
        .disabled(textData.output.isEmpty)
        .padding([.top, .trailing])
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton()
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
            .environmentObject(BookmarksData())
    }
}
