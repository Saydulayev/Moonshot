//
//  ImageResizableSquareModifier.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI

extension Image {
    func missionImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
    }
}
