//
//  ContentView.swift
//  Moonshot
//
//  Created by Akhmed on 16.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var isGridView = true // New state variable for toggling between grid and list
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    if isGridView {
                        LazyVGrid(columns: columns) {
                            missionGrid
                        }
                        .padding([.horizontal, .bottom])
                    } else {
                        VStack {
                            missionGrid
                            
                        }
                    }
                }
                .toolbar { // New toolbar item to toggle the display
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                isGridView.toggle()
                            }
                        }) {
                            Image(systemName: isGridView ? "list.dash" : "square.grid.2x2")
                        }
                    }
                }
                .navigationTitle("Moonshot")
                .background(Color.darkBackground)
                .preferredColorScheme(.dark)
            }
//            if showSplash {
//                AnimatedImage(imageName: "astronaut1")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.darkBackground)
//                    .edgesIgnoringSafeArea(.all)
//            }
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                withAnimation {
//                    showSplash = false
//                }
//            }
//        }
    }
    
    
    var missionGrid: some View {
        ForEach(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30)
                                        .fill(Color.darkBackground))
                        .shadow(color: Color.white.opacity(0.3), radius: 3, x: 5, y: 5)
                        .padding()
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.lightBackground)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.cyan.opacity(0.5))
                    )
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.lightBackground)
                )
            }
        }
    }
}



// Old Code...

//struct ContentView: View {
//    @State private var showSplash = true
//
//
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//
//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
//
//    var body: some View {
//        ZStack {
//            NavigationView {
//                ScrollView {
//                    LazyVGrid(columns: columns) {
//                        ForEach(missions) { mission in
//                            NavigationLink {
//                                MissionView(mission: mission, astronauts: astronauts)
//                            } label: {
//                                VStack {
//                                    Image(mission.image)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 100, height: 100)
//                                        .padding()
//                                        .background(RoundedRectangle(cornerRadius: 30)
//                                            .fill(.darkBackground))
//                                        .shadow(color: Color.white.opacity(0.3), radius: 3, x: 5, y: 5)
//                                        .padding()
//                                    VStack {
//                                        Text(mission.displayName)
//                                            .font(.headline)
//                                            .foregroundColor(.white)
//                                        Text(mission.formattedLaunchDate)
//                                            .font(.caption)
//                                            .foregroundColor(.white.opacity(0.5))
//                                    }
//                                    .padding(.vertical)
//                                    .frame(maxWidth: .infinity)
//                                    .background(.lightBackground)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .stroke(Color.cyan.opacity(0.5))
//                                    )
//                                }
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(.lightBackground)
//                                )
//                            }
//                        }
//                    }
//                    .padding([.horizontal, .bottom])
//                }
//                .navigationTitle("Moonshot")
//                .background(.darkBackground)
//                .preferredColorScheme(.dark)
//            }
//            if showSplash {
//                AnimatedImage(imageName: "astronaut1")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.black)
//                    .edgesIgnoringSafeArea(.all)
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                withAnimation {
//                    showSplash = false
//                }
//            }
//        }
//    }
//}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
