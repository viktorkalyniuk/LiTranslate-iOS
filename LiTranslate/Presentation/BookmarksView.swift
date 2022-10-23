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
            Color(uiColor: Colors.UIColors.Background.main)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .listRowInsets(EdgeInsets())
                .listRowSeparatorTint(.clear)
                .listRowSeparator(.hidden)
                .listRowBackground(Colors.Background.mainView)
            ForEach(bookmarksData.array, id: \.self) { bookmark in
                let bookmarkModel = BookmarkModel(
                    inputLanguage: bookmark.inputLanguage,
                    outputLanguage: bookmark.outputLanguage,
                    inputText: bookmark.inputText,
                    outputText: bookmark.outputText)
                
                BookmarkView(tabSelection: $tabSelection,
                             bookmarkModel: bookmarkModel)
                .listRowBackground(Color.clear)
                .buttonStyle(.plain)
                .background(Colors.Background.primaryView)
                .cornerRadius(CGFloat(Numbers.twentyFive))
                .listRowSeparator(.hidden)
            }
            .onDelete { IndexSet in
                bookmarksData.array.remove(atOffsets: IndexSet)
            }
        }
        .environment(\.defaultMinListRowHeight, 1)
        .modifier(ScrollContentBackgroundModifier())
        .background(Color(uiColor: .systemGray5))
        .listStyle(.sidebar)
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView(tabSelection: .constant(2))
            .environmentObject(BookmarksData())
    }
}
