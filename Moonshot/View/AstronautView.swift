//
//  AstronautView.swift
//  Moonshot
//
//  Created by Saydulayev on 02.11.24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    @Binding var path: NavigationPath 

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(Color.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Home") {
                    path = NavigationPath()
                }
            }
        }
    }
}

//#Preview {
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    
//    return AstronautView(astronaut: astronauts["armstrong"]!)
//        .preferredColorScheme(.dark)
//}

