//
//  BookmarksView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject private var bookmarksData: BookmarksData

    @Binding var tabSelection: Int

    var body: some View {
        List {
            ForEach(bookmarksData.array, id: \.self) { bookmark in
                let bookmarkModel = BookmarkModel(
                    inputLanguage: bookmark.inputLanguage,
                    outputLanguage: bookmark.outputLanguage,
                    inputText: bookmark.inputText,
                    outputText: bookmark.outputText)
                
                BookmarkView(tabSelection: $tabSelection,
                             bookmarkModel: bookmarkModel)
                .buttonStyle(.plain)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(CGFloat(Numbers.twentyFive))
            }
            .onDelete { IndexSet in
                bookmarksData.array.remove(atOffsets: IndexSet)
            }
        }
        .background(Color(uiColor: .systemGray5))
        .listStyle(SidebarListStyle())
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView(tabSelection: .constant(2))
            .environmentObject(BookmarksData())
    }
}
