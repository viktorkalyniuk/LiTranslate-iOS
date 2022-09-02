//
//  BookmarkButton.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 25.08.2022.
//

import SwiftUI

struct BookmarkButton: View {
    @EnvironmentObject var bookmarksData: BookmarksData

    var bookmarkModel: BookmarkModel
    
    var body: some View {
        Button {
            if bookmarksData.isDataInArray(bookmarkModel: bookmarkModel) {
                bookmarksData.removeDataInArray(bookmarkModel: bookmarkModel)
            } else {
                bookmarksData.array.insert(bookmarkModel, at: Numbers.zero)
            }
        } label: {
            if bookmarksData.isDataInArray(bookmarkModel: bookmarkModel) {
                Image(systemName: SystemNames.bookmarkFill)
            } else {
                Image(systemName: SystemNames.bookmark)
            }
        }
        .foregroundColor(Colors.Foreground.primaryButton)
        .opacity(Double(bookmarkModel.outputText.isEmpty ? Numbers.zero : Numbers.one))
        .disabled(bookmarkModel.outputText.isEmpty)
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        let testBookMarkModel: BookmarkModel = BookmarkModel.getTestModel()
        BookmarkButton(bookmarkModel: testBookMarkModel)
            .environmentObject(BookmarksData())
    }
}
