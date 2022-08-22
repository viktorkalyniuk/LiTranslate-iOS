//
//  SettingsView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import SwiftUI

struct SettingsView: View {
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
    
    @State private var isShowingAlert: Bool = false

    @EnvironmentObject var instance: InstanceURL

    var body: some View {
        NavigationView {
            List() {
                if let saveUkraineURL = URL(string: Links.Info.saveUkraine) {
                    Link(destination: saveUkraineURL) {
                        HStack {
                            Text(saveUkraineTitle)
                            Spacer()
                            Image(systemName: SystemNames.openLink)
                        }
                    }
                }
                Section {
                    NavigationLink(selfHostingTitle) {
                        SelfHostingView()
                    }
                    DefaultInstancePicker()
                } header: {
                    Text(hostingTitle)
                } footer: {
                    Text(currentInstanceTitle + instance.getURL())
                }
                .textCase(nil)
                Section(infoTitle) {
                    if let sourceCodeURL = URL(string: Links.Info.sourceCode) {
                        Link(destination: sourceCodeURL) {
                            HStack {
                                Text(sourceCodeTitle)
                                Spacer()
                                Image(systemName: SystemNames.openLink)
                            }
                        }
                    }
                    HStack {
                        Text(policyTitle)
                        Spacer()
                        Image(systemName: SystemNames.openLink)
                    }
                    if let licenseURL = URL(string: Links.Info.license) {
                        Link(destination: licenseURL) {
                            HStack {
                                Text(licenceTitle)
                                Spacer()
                                Image(systemName: SystemNames.openLink)
                            }
                        }
                    }
                }
                .textCase(nil)
                Section(supportTitle) {
                    #warning("Add logic")
                    HStack {
                        Text(rateUsTitle)
                        Spacer()
                        Image(systemName: SystemNames.openLink)
                    }
                }
                .textCase(nil)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(InstanceURL())
    }
}
