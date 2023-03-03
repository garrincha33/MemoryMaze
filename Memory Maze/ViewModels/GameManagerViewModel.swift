//
//  GameManagerViewModel.swift
//  Memory Maze
//
//  Created by Richard Price on 03/03/2023.
//

import Foundation
import StoreKit

class GameManager {
    
    // Singleton instance
    static let shared = GameManager()
    
    // Private initializer to prevent creating instances
    private init() {}
    
    // Properties
    var currentLevel: Int = 1
    var currentLives: Int = 3
    
    // Methods
    func startNewGame() {
        currentLevel = 1
        currentLives = 3
    }
    
    func nextLevel() {
        currentLevel += 1
    }
    
    func loseLife() {
        currentLives -= 1
    }
    
    func isGameOver() -> Bool {
        return currentLives == 0
    }
    
    // In-app purchase methods
    func purchaseExtraLives() {
        // TODO: Implement in-app purchase logic
    }
    
    func purchasePowerUp() {
        // TODO: Implement in-app purchase logic
    }
}




