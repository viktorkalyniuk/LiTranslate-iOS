//
//  BookmarkView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject private var selection: LanguagesSelection
    @EnvironmentObject private var textData: TextData

    @Binding var tabSelection: Int
    
    var bookmarkModel: BookmarkModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    FlagImageView(language: .constant(bookmarkModel.inputLanguage), color: Colors.Background.primaryView)
                    Image(systemName: SystemNames.arrowRight)
                    FlagImageView(language: .constant(bookmarkModel.outputLanguage), color: Colors.Background.primaryView)
                }
                .onTapGesture {
                    bookmarkModel.assignTo(selection: selection,
                                           textData: textData)

                    self.tabSelection = 1
                }
                Spacer()
                BookmarkButton(bookmarkModel: bookmarkModel)
                    .padding(.bottom)
            }
            VStack(alignment: .leading) {
                Text("\(bookmarkModel.inputText)")
                    .padding(.top)
                Divider()
                Text("\(bookmarkModel.outputText)")
            }
            .onTapGesture {
                bookmarkModel.assignTo(selection: selection,
                                       textData: textData)
                
                self.tabSelection = 1
            }
        }
        .padding()
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        let testBookmarkModel: BookmarkModel = BookmarkModel.getTestModel()
        BookmarkView(tabSelection: .constant(2), bookmarkModel: testBookmarkModel)
            .environmentObject(LanguagesSelection())
            .environmentObject(TextData())
            .environmentObject(BookmarksData())
    }
}
