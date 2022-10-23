//
//  SettingsView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var instance: InstanceURL
    
    @State private var isShowingAlert: Bool = false

    private let saveUkraineTitle: String = "Save Ukraine 🇺🇦"
    private let hostingTitle: String = "Hosting"
    private let selfHostingTitle: String = "Self Hosting"
    private let currentInstanceTitle: String = "Current used instance:\n"
    private let infoTitle: String = "Info"
    private let sourceCodeTitle: String = "Source Code"
    private let policyTitle: String = "Privacy Policy"
    private let licenceTitle: String = "License"
    private let supportTitle: String = "Support"
    private let rateUsTitle: String = "Rate in the App Store"

    var body: some View {
        NavigationView {
            List() {
                LinkView(urlString: Links.Info.saveUkraine, title: saveUkraineTitle)
                Section {
                    NavigationLink(selfHostingTitle) {
                        SelfHostingView()
                    }
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
                    DefaultInstancePicker()
                        .listRowBackground(Colors.Background.primaryView)
                        .foregroundColor(Colors.Foreground.label)
                } header: {
                    Text(hostingTitle)
                } footer: {
                    Text(currentInstanceTitle + instance.getURL())
                }
                .textCase(nil)
                Section(infoTitle) {
                    LinkView(urlString: Links.Info.sourceCode, title: sourceCodeTitle)
                    LinkView(urlString: Links.Info.privacy, title: policyTitle)
                    LinkView(urlString: Links.Info.license, title: licenceTitle)
                }
                .textCase(nil)
                Section(supportTitle) {
                    LinkView(urlString: Links.Info.liTranslateAppStore, title: rateUsTitle)
                }
                .textCase(nil)
            }
            .modifier(ScrollContentBackgroundModifier())
            .background(Colors.Background.mainView)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(InstanceURL())
    }
}
