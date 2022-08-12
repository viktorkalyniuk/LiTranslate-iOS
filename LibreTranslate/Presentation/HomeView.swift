//
//  HomeView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var input: String = ""

    var body: some View {
        VStack {
            ChooseLanguagesView()
            TextEditor(text: $input)
                .onChange(of: input, perform: { newValue in
                    print("\(input)")
                })
                .padding()
            TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
