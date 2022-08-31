//
//  LanguagesListView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 23.08.2022.
//

import SwiftUI

struct LanguagesListView: View {
    @ObservedObject var languages: LanguagesSelection

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State private var searchText: String = ""

    var textMethod: TextMethod

    var body: some View {
        List {
            ForEach(searchText.isEmpty ?
                    Languages.allCases :
                        Languages.allCases.filter { $0.getCountryName().contains(searchText) }, id: \.self) { language in
                Button {
                    switch textMethod {
                    case .input:
                        languages.input = language
                    case .output:
                        languages.output = language
                    }
                    self.mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        FlagImageView(language: .constant(language), color: Color(uiColor: .systemGray5))
                        Text(language.getCountryName())
                    }
                }
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search")
            .listRowBackground(Color(uiColor: .systemGray6))
        }
        .background(Color(uiColor: .systemGray5))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LanguagesListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesListView(languages: LanguagesSelection(), textMethod: .input)
    }
}
