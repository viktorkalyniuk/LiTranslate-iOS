//
//  ChooseLanguagesView.swift
//  LibreTranslate
//
//  Created by Viktor Kalyniuk on 12.08.2022.
//

import SwiftUI

struct ChooseLanguagesView: View {
    @State private var firstSelection: Languages = .uk
    @State private var secondSelection: Languages = .en

    var body: some View {
        HStack {
            Picker(selection: $firstSelection, label: Text("Language")) {
                ForEach(Languages.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            Spacer()
            Button {
                (firstSelection, secondSelection) = (secondSelection, firstSelection)
            } label: {
                Image(systemName: SystemNames.shuffle)
            }
            Spacer()
            Picker(selection: $secondSelection, label: Text("Language")) {
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
        ChooseLanguagesView()
    }
}
