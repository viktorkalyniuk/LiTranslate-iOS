//
//  KeyboardReadable.swift
//  LiTranslate
//
//  Created by George: https://stackoverflow.com/users/9607863/george
//  Found on:
//  https://stackoverflow.com/questions/65784294/how-to-detect-if-keyboard-is-present-in-swiftui

import Combine
import UIKit

protocol KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> { get }
}

extension KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },

            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .eraseToAnyPublisher()
    }
}
