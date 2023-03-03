//
//  ContentView.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    let maze = MazeGenerator(rows: 10, columns: 10).generateMaze()
    
    var body: some View {
        NavigationView {
            VStack {
                MazeView(maze: maze)
                    .aspectRatio(1.0, contentMode: .fit)
                Spacer()
            }
            .navigationBarTitle("Memory Maze")
        }
    }
}

struct MazeView_Previews: PreviewProvider {
    static var previews: some View {
        MazeView(maze: MazeGenerator(rows: 5, columns: 5).generateMaze())
    }
}

