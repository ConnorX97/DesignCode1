//
//  Modifiers.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 04/01/24.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black .opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: .black .opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .default))
    }
}

struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28
    func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
    }
}
