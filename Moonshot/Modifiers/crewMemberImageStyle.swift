//
//  crewMemberImageStyle.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI

extension Image {
    func crewMemberImageStyle() -> some View {
        self
            .resizable()
            .frame(width: 104, height: 72)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(Color.white, lineWidth: 1)
            )
    }
}
