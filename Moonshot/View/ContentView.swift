//
//  ContentView.swift
//  Moonshot
//
//  Created by Saydulayev on 30.10.24.
//

import SwiftUI


struct ContentView: View {
    @State private var path = NavigationPath()
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions, path: $path)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions, path: $path)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingGrid.toggle()
                    }) {
                        Label("Switch View", systemImage: showingGrid ? "list.bullet" : "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}


#Preview {
    ContentView()
}
