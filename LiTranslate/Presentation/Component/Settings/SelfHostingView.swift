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

    @State private var input: String = ""

    private let selfHostingTitle = "Self Hosting"
    private let textFieldTitle = "url"
    private let useInstanceTitle = "Use default instance"
    private let infoTitle = "Info"
    private let instructionTitle = "Instruction"
    private let doneTitle = "Done"

    private let backgroundColor: Color = Color(uiColor: .systemGray5)
    private let listRowBackgroundColor: Color = Color(uiColor: .systemGray6)
    private let rowTint: Color = Color(uiColor: .label)

    var body: some View {
        List {
            Section(selfHostingTitle) {
                TextField(textFieldTitle, text: $input)
                    .onAppear {
                        input = instance.selfHostURL
                    }
                    .listRowBackground(listRowBackgroundColor)
                    .foregroundColor(rowTint)
            }
            .textCase(nil)
            Button {
                instance.selfHostURL = ""
                self.mode.wrappedValue.dismiss()
            } label: {
                Text(useInstanceTitle)
                    .foregroundColor(rowTint)
            }
            .listRowBackground(listRowBackgroundColor)
            Section(infoTitle) {
                if let url = URL(string: Links.Info.libreTranslateHosting) {
                    Link(destination: url) {
                        HStack {
                            Text(instructionTitle)
                            Spacer()
                            Image(systemName: SystemNames.openLink)
                        }
                        .foregroundColor(rowTint)
                    }
                    .listRowBackground(listRowBackgroundColor)
                }
            }
            .textCase(nil)
        }
        .background(backgroundColor)
        .toolbar {
            Button {
                instance.selfHostURL = input
                self.mode.wrappedValue.dismiss()
            } label: {
                Text(doneTitle)
            }
        }
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct SelfHostingView_Previews: PreviewProvider {
    static var previews: some View {
        SelfHostingView()
            .environmentObject(InstanceURL())
    }
}
