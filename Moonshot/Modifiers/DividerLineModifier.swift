//
//  CustomViewModifier.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI


// Custom Rectangle
struct DividerLineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

extension View {
    func dividerLine() -> some View {
        self.modifier(DividerLineModifier())
    }
}
