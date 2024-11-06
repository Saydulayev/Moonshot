//
//  MissionView.swift
//  Moonshot
//
//  Created by Saydulayev on 02.11.24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                
                VStack(alignment: .leading) {
                    Text("Date: \(mission.formattedLaunchDate)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.bottom, -20)
                        .dividerLine()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                    
                    Text(mission.description)
                        .dividerLine()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.self) { crewMember in
                            NavigationLink(value: crewMember.astronaut) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .crewMemberImageStyle()
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut], path: Binding<NavigationPath>) {
        self.mission = mission
        self._path = path 
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Could not find astronaut \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[5], astronauts: astronauts, path: .constant(NavigationPath()))
        .preferredColorScheme(.dark)
}





