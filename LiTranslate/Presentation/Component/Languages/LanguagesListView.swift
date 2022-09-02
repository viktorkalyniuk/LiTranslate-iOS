//
//  LanguagesListView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 23.08.2022.
//

import SwiftUI

struct LanguagesListView: View {
    @ObservedObject var languages: LanguagesSelection

    @Environment(\.dismiss) var dismissView

    @State private var searchText: String = ""
    @State private var languagesArray: [Languages] = Languages.allCases
    @State private var listID: Int = Numbers.one

    var textMethod: TextMethod

    var body: some View {
        List {
            Section() {
//                TextField("Search", text: $searchText)
                SearchBarView(inputText: $searchText)
            }
            ForEach(languagesArray, id: \.self) { language in
                LanguageView(language: language,
                             flagBorderColor: Colors.Background.primaryView)
                .onTapGesture {
                    switch textMethod {
                    case .input:
                        languages.input = language
                    case .output:
                        languages.output = language
                    }
                    dismissView()
                }
            }
            .listRowBackground(Colors.Background.primaryView)
            .onChange(of: searchText) { _ in
                if searchText.isEmpty {
                    languagesArray = Languages.allCases
                } else {
                    languagesArray = Languages.allCases.filter {
                        $0.getCountryName().contains(searchText)
                    }
                }
            }
        }
        .id(listID)
        .background(Colors.Background.mainView)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            listID += Numbers.one
        }
    }
}

struct LanguagesListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesListView(languages: LanguagesSelection(), textMethod: .input)
    }
}
