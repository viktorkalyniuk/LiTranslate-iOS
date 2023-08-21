//
//  SelfHostingView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import SwiftUI

struct SelfHostingView: View {
    @EnvironmentObject var instance: InstanceURL

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State private var inputURL: String = ""
    @State private var inputKey: String = ""

    private let selfHostingTitle = "Self Hosting"
    private let textFieldTitle = "url"
    private let selfApiTitle = "API Key"
    private let textApiTitle = "key"
    private let useInstanceTitle = "Use default instance"
    private let infoTitle = "Info"
    private let instructionTitle = "Instruction"
    private let doneTitle = "Done"

    var body: some View {
        List {
            Section(selfHostingTitle) {
                TextField(textFieldTitle, text: $inputURL)
                    .onAppear {
                        inputURL = instance.selfHostURL
                    }
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
            }
            .textCase(nil)
            Section(selfApiTitle) {
                TextField(textApiTitle, text: $inputKey)
                    .onAppear {
                        inputKey = instance.selfHostKey
                    }
                    .listRowBackground(Colors.Background.primaryView)
                    .foregroundColor(Colors.Foreground.label)
            }
            .textCase(nil)
            Button {
                instance.selfHostURL = ""
                self.mode.wrappedValue.dismiss()
            } label: {
                Text(useInstanceTitle)
                    .foregroundColor(Colors.Foreground.label)
            }
            .listRowBackground(Colors.Background.primaryView)
            Section(infoTitle) {
                if let url = URL(string: Links.Info.libreTranslateHosting) {
                    Link(destination: url) {
                        HStack {
                            Text(instructionTitle)
                            Spacer()
                            Image(systemName: SystemNames.openLink)
                        }
                        .foregroundColor(Colors.Foreground.label)
                    }
                }
            }
            .listRowBackground(Colors.Background.primaryView)
            .textCase(nil)
        }
        .modifier(ScrollContentBackgroundModifier())
        .background(Colors.Background.mainView)
        .toolbar {
            Button {
                instance.selfHostURL = inputURL
                instance.selfHostKey = inputKey
                self.mode.wrappedValue.dismiss()
            } label: {
                Text(doneTitle)
            }
        }
    }
}

struct SelfHostingView_Previews: PreviewProvider {
    static var previews: some View {
        SelfHostingView()
            .environmentObject(InstanceURL())
    }
}
