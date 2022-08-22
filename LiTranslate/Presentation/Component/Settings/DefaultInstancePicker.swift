//
//  DefaultInstancePicker.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import SwiftUI

struct DefaultInstancePicker: View {
    private let defaultInstancesTitle: String = "Default Instances"

    @State private var instances: Links.LibreTranslateMirrors = Links.LibreTranslateMirrors.de

    @EnvironmentObject var instance: InstanceURL

    var body: some View {
        Picker(defaultInstancesTitle, selection: $instance.defaultURL) {
            ForEach(Links.LibreTranslateMirrors.allCases, id: \.self) { url in
                Text(url.rawValue)
            }
        }
        .onChange(of: instance.defaultURL) { newValue in
            instance.defaultURL = newValue
        }
    }
}

struct DefaultInstancePicker_Previews: PreviewProvider {
    static var previews: some View {
        DefaultInstancePicker()
            .environmentObject(InstanceURL())
    }
}
