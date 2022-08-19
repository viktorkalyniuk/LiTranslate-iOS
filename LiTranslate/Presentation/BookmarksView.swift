//
//  BookmarksView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject var bookmarksData: BookmarksData
    
    var body: some View {
        List {
            ForEach(bookmarksData.array, id: \.self) { bookmark in
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
            .onDelete { IndexSet in
                bookmarksData.array.remove(atOffsets: IndexSet)
            }
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
