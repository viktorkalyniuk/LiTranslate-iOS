//
//  HomeView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var selection: LanguagesSelection = LanguagesSelection()
    
    var body: some View {
        VStack {
            OutputTranslationView().environmentObject(selection)
            InputTranslationView().environmentObject(selection)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
