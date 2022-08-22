//
//  ContentView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var selection: LanguagesSelection = LanguagesSelection()
    @StateObject private var textData: TextData = TextData()
    @StateObject private var bookmarksData: BookmarksData = BookmarksData()
    @StateObject private var instance: InstanceURL = InstanceURL()
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(selection)
                .environmentObject(textData)
                .environmentObject(bookmarksData)
                .environmentObject(instance)
                .tabItem {
                    Image(systemName: SystemNames.globe)
                    Text(Names.translateTabItemName)
                }
            BookmarksView()
                .environmentObject(bookmarksData)
                .tabItem {
                    Image(systemName: SystemNames.bookmarkFill)
                    Text(Names.bookmarksTabItemName)
                }
            SettingsView()
                .environmentObject(instance)
                .tabItem {
                    Image(systemName: SystemNames.settings)
                    Text(Names.settingsTabItemName)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
