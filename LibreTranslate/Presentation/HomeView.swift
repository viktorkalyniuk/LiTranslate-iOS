//
//  HomeView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            OutputTranslationView()
            InputTranslationView()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
