//
//  InstanceURL.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 22.08.2022.
//

import Foundation
import SwiftUI

class InstanceURL: ObservableObject {
    @AppStorage(Keys.libreTranslateDefaultURL) var defaultURL: Links.LibreTranslateMirrors = Links.LibreTranslateMirrors.de
    @AppStorage(Keys.libreTranslateSelfHostURL) var selfHostURL: String = ""

    func getURL() -> String {
        if selfHostURL.isEmpty {
            return defaultURL.rawValue
        }

        return selfHostURL
    }

}
