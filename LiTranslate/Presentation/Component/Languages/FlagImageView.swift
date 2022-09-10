//
//  FlagImageView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 23.08.2022.
//

import SwiftUI

struct FlagImageView: View {
    @Binding var language: Languages

    var color: Color

    var frameHeight: CGFloat = CGFloat(Numbers.thirty)
    var lineWidth: CGFloat = CGFloat(Numbers.three)
    var radius: CGFloat = CGFloat(Numbers.two)
    var x: CGFloat = CGFloat(Numbers.zero)
    var y: CGFloat = CGFloat(Numbers.zero)

    var body: some View {
        Image(language.rawValue)
            .resizable()
            .scaledToFit()
            .frame(height: frameHeight)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(color, lineWidth: lineWidth)
            }
            .shadow(radius: radius, x: x, y: y)
    }
}

struct FlagImageView_Previews: PreviewProvider {
    static var previews: some View {
        FlagImageView(language: .constant(Languages.uk), color: Color(uiColor: .systemBlue))
    }
}
