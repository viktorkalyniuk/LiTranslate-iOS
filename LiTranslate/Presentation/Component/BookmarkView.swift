//
//  BookmarkView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarkView: View {
    @State var inputLanguage: String
    @State var outputLanguage: String

    @State var inputText: String
    @State var outputText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(inputLanguage) > \(outputLanguage)")
                .padding()
            Text("\(inputText)")
                .padding()
            Divider()
            Text("\(outputText)")
                .padding()
        }
        .padding()
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView(inputLanguage: "en", outputLanguage: "fr", inputText: "Hello", outputText: "Bonjour")
    }
}
