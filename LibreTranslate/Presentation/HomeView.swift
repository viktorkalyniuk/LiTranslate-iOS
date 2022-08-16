//
//  HomeView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var selection: LanguagesSelection = LanguagesSelection()
    @StateObject private var textData: TextData = TextData()
    
    var body: some View {
        VStack {
            OutputTranslationView().environmentObject(selection)
                .environmentObject(textData)
            InputTranslationView().environmentObject(selection)
                .environmentObject(textData)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
