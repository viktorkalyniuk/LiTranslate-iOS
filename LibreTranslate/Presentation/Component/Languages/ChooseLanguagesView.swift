//
//  ChooseLanguagesView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct ChooseLanguagesView: View {
    @ObservedObject var selection: LanguagesSelection

    var body: some View {
        HStack {
            Picker(selection: $selection.input, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            Spacer()
            Button {
                (selection.input, selection.output) = (selection.output, selection.input)
            } label: {
                Image(systemName: SystemNames.swap)
                    .rotationEffect(.degrees(-Double(Numbers.ninety)))
            }
            Spacer()
            Picker(selection: $selection.output, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LanguagesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguagesView(selection: LanguagesSelection())
    }
}
