//
//  BookmarksView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData
    @EnvironmentObject private var bookmarksData: BookmarksData

    @Binding var tabSelection: Int
    
    var body: some View {
        List {
            ForEach(bookmarksData.array, id: \.self) { bookmark in
                Button {
                    selection.output = bookmark.outputLanguage
                    selection.input = bookmark.inputLanguage
                    textData.output = bookmark.outputText
                    textData.input = bookmark.inputText

                    self.tabSelection = 1
                } label: {
                    BookmarkView(
                        inputLanguage:
                            bookmark.inputLanguage,
                        outputLanguage:
                            bookmark.outputLanguage,
                        inputText:
                            bookmark.inputText,
                        outputText:
                            bookmark.outputText
                    )
                }
                .buttonStyle(.plain)
                .background(Color(uiColor: .systemBackground))
                .cornerRadius(CGFloat(Numbers.twentyFive))
            }
            .onDelete { IndexSet in
                bookmarksData.array.remove(atOffsets: IndexSet)
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView(tabSelection: .constant(2))
            .environmentObject(BookmarksData())
    }
}
