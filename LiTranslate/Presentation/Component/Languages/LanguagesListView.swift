//
//  LanguagesListView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 23.08.2022.
//

import SwiftUI

struct LanguagesListView: View {
    @EnvironmentObject private var languages: LanguagesSelection
    @EnvironmentObject private var recentlyUsedLanguages: RecentlyUsedLanguages

    @Environment(\.dismiss) var dismissView

    @State private var searchText: String = ""
    @State private var languagesArray: [Languages] = Languages.allCases
    @State private var listID: Int = Numbers.one

    var textMethod: TextMethod

    var body: some View {
        List {
            Section() {
                SearchBarView(inputText: $searchText)
                    .listRowBackground(Colors.Background.primaryView)
            }
            if !recentlyUsedLanguages.array.isEmpty && searchText.isEmpty {
                Section("Recently Used") {
                    ForEach(recentlyUsedLanguages.array) { language in
                        LanguageView(language: language, flagBorderColor: Colors.Background.primaryView)
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
                }
                .textCase(nil)
            }
            Section("All Languages") {
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
                        recentlyUsedLanguages.append(language: language)
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
            .textCase(nil)
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
        LanguagesListView(textMethod: .input)
            .environmentObject(LanguagesSelection())
            .environmentObject(RecentlyUsedLanguages())
    }
}
