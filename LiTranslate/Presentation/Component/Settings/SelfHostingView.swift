//
//  SelfHostingView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import SwiftUI

struct SelfHostingView: View {
    private let selfHostingTitle = "Self Hosting"
    private let textFieldTitle = "url"
    private let useInstanceTitle = "Use default instance"
    private let infoTitle = "Info"
    private let instructionTitle = "Instruction"
    private let doneTitle = "Done"

    @State private var input: String = ""

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @EnvironmentObject var instance: InstanceURL

    var body: some View {
        List {
            Section(selfHostingTitle) {
                TextField(textFieldTitle, text: $input)
                    .onAppear {
                        input = instance.selfHostURL
                    }
            }
            .textCase(nil)
            Button {
                instance.selfHostURL = ""
                self.mode.wrappedValue.dismiss()
            } label: {
                Text(useInstanceTitle)
            }
            Section(infoTitle) {
                if let url = URL(string: Links.Info.libreTranslateHosting) {
                    Link(destination: url) {
                        HStack {
                            Text(instructionTitle)
                            Spacer()
                            Image(systemName: SystemNames.openLink)
                        }
                    }
                }
            }
            .textCase(nil)
        }
        .toolbar {
            Button {
                instance.selfHostURL = input
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
