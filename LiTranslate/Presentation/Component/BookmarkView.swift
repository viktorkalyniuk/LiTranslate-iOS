//
//  BookmarkView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct BookmarkView: View {
    @State var inputLanguage: Languages
    @State var outputLanguage: Languages

    @State var inputText: String
    @State var outputText: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                FlagImageView(language: .constant(inputLanguage), color: Color(uiColor: .systemGray6))
                Image(systemName: SystemNames.arrowRight)
                FlagImageView(language: .constant(outputLanguage), color: Color(uiColor: .secondarySystemBackground))
            }
//                .padding()
            Text("\(inputText)")
                .padding(.top)
            Divider()
            Text("\(outputText)")
//                .padding()
        }
        .padding()
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView(inputLanguage: Languages.uk, outputLanguage: Languages.fr, inputText: "Hello", outputText: "Bonjour")
    }
}
