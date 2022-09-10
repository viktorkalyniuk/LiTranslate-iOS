//
//  LinkView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 05.09.2022.
//

import SwiftUI

struct LinkView: View {
    var urlString: String
    var title: String

    var body: some View {
        if let licenseURL = URL(string: urlString) {
            Link(destination: licenseURL) {
                HStack {
                    Text(title)
                    Spacer()
                    Image(systemName: SystemNames.openLink)
                }
            }
            .listRowBackground(Colors.Background.primaryView)
            .foregroundColor(Colors.Foreground.label)
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(urlString: "", title: "")
    }
}
