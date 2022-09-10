//
//  HomeView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                OutputTranslationView()
                InputTranslationView()
                    .padding(.top)
                    .padding(.top)
            }
            .padding()
            .background(Colors.Background.mainView)
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TextData())
            .environmentObject(LanguagesSelection())
            .environmentObject(BookmarksData())
    }
}
