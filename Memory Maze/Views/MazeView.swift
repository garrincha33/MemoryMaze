//
//  MazeView.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import SwiftUI


struct MazeView: View {
    
    let maze: [[MazeGenerator.Cell]]
    var player: Player = Player(row: 0, column: 0) // initialize player at top-left corner
    
    var body: some View {
        GeometryReader { geometry in
            let cellSize = min(geometry.size.width, geometry.size.height) / CGFloat(max(maze.count, maze.first?.count ?? 0))
            
            ZStack {
                ForEach(0..<maze.count) { row in
                    ForEach(0..<maze[row].count) { col in
                        let x = CGFloat(col) * cellSize
                        let y = CGFloat(row) * cellSize
                        let cell = maze[row][col]
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: cellSize, height: cellSize)
                            .position(x: x + cellSize/2, y: y + cellSize/2)
                        
                        if cell.topWall {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: cellSize, height: 2)
                                .position(x: x + cellSize/2, y: y)
                        }
                        
                        if cell.rightWall {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 2, height: cellSize)
                                .position(x: x + cellSize, y: y + cellSize/2)
                        }
                        
                        if cell.bottomWall {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: cellSize, height: 2)
                                .position(x: x + cellSize/2, y: y + cellSize)
                        }
                        
                        if cell.leftWall {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 2, height: cellSize)
                                .position(x: x, y: y + cellSize/2)
                        }
                    }
                }
                
                // Draw player marker
                drawPlayerMarker(cellSize: cellSize)
            }
        }
    }
    
    private func drawPlayerMarker(cellSize: CGFloat) -> some View {
        let x = CGFloat(player.column) * cellSize
        let y = CGFloat(player.row) * cellSize
        
        return Circle()
            .fill(Color.blue)
            .frame(width: cellSize/2, height: cellSize/2)
            .position(x: x + cellSize/2, y: y + cellSize/2)
    }
}

class Player {
    var row: Int
    var column: Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
}






