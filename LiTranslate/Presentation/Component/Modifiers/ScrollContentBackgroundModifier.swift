//
//  ScrollContentBackgroundModifier.swift
//  LiTranslate
//
//  Created by Marian König.
//  Found on:
//  https://stackoverflow.com/questions/72649907/ios-16-swiftui-list-background.
//

import SwiftUI

struct ScrollContentBackgroundModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}
