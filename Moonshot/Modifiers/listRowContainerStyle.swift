//
//  missionContainerViewStyle.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI

extension View {
    func listRowContainerStyle() -> some View {
        self
            .padding(.horizontal, 10)
            .background(Color.lightBackground)
            .clipShape(RoundedRectangle(cornerRadius: 0))
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.darkBackground, lineWidth: 1)
            )
    }
}
