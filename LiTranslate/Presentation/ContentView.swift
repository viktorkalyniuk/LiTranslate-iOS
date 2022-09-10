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
    @StateObject private var recentlyUsedLanguages: RecentlyUsedLanguages = RecentlyUsedLanguages()

    @State private var tabSelection: Int = Numbers.one

    let navigationAppearance = UINavigationBarAppearance()

    init() {
        let _ = UIPasteboard.general

        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = Colors.UIColors.Background.main
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = Colors.UIColors.Background.main

        UITableView.appearance().backgroundColor = Colors.UIColors.Background.main

        UIScrollView.appearance().keyboardDismissMode = .onDrag

        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .environmentObject(selection)
                .environmentObject(textData)
                .environmentObject(bookmarksData)
                .environmentObject(instance)
                .environmentObject(recentlyUsedLanguages)
                .tabItem {
                    Image(Names.Images.liTranslateIcon).font(.system(size: 28))
                    Text(Names.translateTabItemName)
                }
                .tag(Numbers.one)
            BookmarksView(tabSelection: $tabSelection)
                .environmentObject(selection)
                .environmentObject(textData)
                .environmentObject(bookmarksData)
                .tabItem {
                    Image(systemName: SystemNames.bookmarkFill)
                    Text(Names.bookmarksTabItemName)
                }
                .tag(Numbers.two)
            SettingsView()
                .environmentObject(instance)
                .tabItem {
                    Image(systemName: SystemNames.settings)
                    Text(Names.settingsTabItemName)
                }
                .tag(Numbers.three)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
