//
//  MazeGenerator.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import Foundation

class MazeGenerator {
    
    struct Cell {
        var topWall: Bool = true
        var rightWall: Bool = true
        var bottomWall: Bool = true
        var leftWall: Bool = true
        var visited: Bool = false
    }
    
    let rows: Int
    let columns: Int
    
    var cells: [[Cell]]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        
        cells = Array(repeating: Array(repeating: Cell(), count: columns), count: rows)
    }
    
    func generateMaze() -> [[Cell]] {
        var stack: [(row: Int, col: Int)] = []
        var current: (row: Int, col: Int) = (0, 0)
        
        cells[current.row][current.col].visited = true
        
        while true {
            let neighbors = getUnvisitedNeighbors(row: current.row, col: current.col)
            
            if neighbors.count > 0 {
                stack.append(current)
                
                let next = neighbors.randomElement()!
                
                if next.row < current.row {
                    cells[current.row][current.col].topWall = false
                    cells[next.row][next.col].bottomWall = false
                }
                else if next.row > current.row {
                    cells[current.row][current.col].bottomWall = false
                    cells[next.row][next.col].topWall = false
                }
                else if next.col < current.col {
                    cells[current.row][current.col].leftWall = false
                    cells[next.row][next.col].rightWall = false
                }
                else if next.col > current.col {
                    cells[current.row][current.col].rightWall = false
                    cells[next.row][next.col].leftWall = false
                }
                
                current = next
                cells[current.row][current.col].visited = true
            }
            else if stack.count > 0 {
                current = stack.popLast()!
            }
            else {
                break
            }
        }
        
        return cells
    }
    
    private func getUnvisitedNeighbors(row: Int, col: Int) -> [(row: Int, col: Int)] {
        var neighbors: [(row: Int, col: Int)] = []
        
        if row > 0 && !cells[row-1][col].visited {
            neighbors.append((row-1, col))
        }
        if row < rows-1 && !cells[row+1][col].visited {
            neighbors.append((row+1, col))
        }
        if col > 0 && !cells[row][col-1].visited {
            neighbors.append((row, col-1))
        }
        if col < columns-1 && !cells[row][col+1].visited {
            neighbors.append((row, col+1))
        }
        
        return neighbors
    }
}

