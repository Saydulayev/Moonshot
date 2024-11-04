//
//  missionImageViewStyle.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI

extension Image {
    func missionImageViewStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
            .background(Color.darkBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.lightBackground, lineWidth: 1)
            )
            .padding(5)
            .shadow(color: Color.darkBackground, radius: 5)
    }
}
