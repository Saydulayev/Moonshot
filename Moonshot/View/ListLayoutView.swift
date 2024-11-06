//
//  ListLayout.swift
//  Moonshot
//
//  Created by Saydulayev on 04.11.24.
//

import SwiftUI



struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    @Binding var path: NavigationPath 

    var body: some View {
        List(missions) { mission in
            NavigationLink(value: mission) {
                HStack(spacing: 16) {
                    Image(mission.image)
                        .missionImageViewStyle()
                    
                    VStack(alignment: .center, spacing: 4) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Divider()
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
            .listRowInsets(EdgeInsets())
            .listRowContainerStyle()
        }
        .listStyle(.plain)
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronauts: astronauts, path: $path)
        }
    }
}




//#Preview {
//    ListLayout()
//}
