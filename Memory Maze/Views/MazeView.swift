//
//  MazeView.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import SwiftUI

struct MazeView: View {
    
    let maze: [[MazeGenerator.Cell]]
    
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
            }
        }
    }
}


