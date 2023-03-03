//
//  ContentView.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Memory Maze")
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink(destination: GameView()) {
                    Text("New Game")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct GameView: View {
    var body: some View {
        Text("Game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

