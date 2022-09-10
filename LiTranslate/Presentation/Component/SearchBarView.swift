//
//  SearchBarView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 02.09.2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var inputText: String

    private let searchIcon: Image = Image(systemName: SystemNames.magnifyingglass)
    private let searchText: String = "Search"

    var body: some View {
        HStack {
            TextField("\(searchIcon) \(searchText)", text: $inputText)
            Button {
                inputText = ""
            } label: {
                Image(systemName: SystemNames.closeCircleFill)
                    .foregroundColor(Colors.Foreground.tertiaryLabel)
            }
            .buttonStyle(.plain)
            .opacity(Double(inputText.isEmpty ? Numbers.zero : Numbers.one))
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(inputText: .constant(""))
    }
}
