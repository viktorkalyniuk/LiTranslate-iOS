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
                if let saveUkraineURL = URL(string: Links.Info.saveUkraine) {
                    Link(destination: saveUkraineURL) {
                        HStack {
                            Text(saveUkraineTitle)
                            Spacer()
                            Image(systemName: SystemNames.openLink)
                        }
                    }
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
                }
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
                    if let sourceCodeURL = URL(string: Links.Info.sourceCode) {
                        Link(destination: sourceCodeURL) {
                            HStack {
                                Text(sourceCodeTitle)
                                Spacer()
                                Image(systemName: SystemNames.openLink)
                            }
                        }
                        .listRowBackground(Colors.Background.primaryView)
                        .foregroundColor(Colors.Foreground.label)
                    }
                    HStack {
                        Text(policyTitle)
                        Spacer()
                        Image(systemName: SystemNames.openLink)
                    }
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
                    if let licenseURL = URL(string: Links.Info.license) {
                        Link(destination: licenseURL) {
                            HStack {
                                Text(licenceTitle)
                                Spacer()
                                Image(systemName: SystemNames.openLink)
                            }
                        }
                        .listRowBackground(Colors.Background.primaryView)
                        .foregroundColor(Colors.Foreground.label)
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
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
                }
                .textCase(nil)
            }
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
