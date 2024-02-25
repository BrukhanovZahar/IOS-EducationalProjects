//
//  Game.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 19.02.2024.
//

import Foundation

protocol GameProtocol {
    associatedtype SecretType
    var score : Int { get }
    var isGameEnded: Bool { get }
    var secretValue: SecretType { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(secretValue: SecretType, userValue: SecretType)
}


class Game<T: SecretValueProtocol>: GameProtocol {
    typealias SecretType = T
    var score: Int = 0
    var secretValue: T
    
    private var compareClosure: (T, T) -> Int
    private var roundsCount: Int!
    private var currentRoundNumber: Int = 0
    var isGameEnded: Bool {
        if currentRoundNumber == roundsCount {
            return true
        } else {
            return false
        }
    }
    
    init(secretValue: T, rounds: Int, compareClosure: @escaping (T, T) -> Int) {
        self.secretValue = secretValue
        roundsCount = rounds
        self.compareClosure = compareClosure
        startNewRound()
    }
    
    func restartGame() {
        score = 0
        currentRoundNumber = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRoundNumber += 1
        secretValue.setRandomValue()
    }
    
    func calculateScore(secretValue: T, userValue: T) {
        score = score + compareClosure(secretValue, userValue)
    }
    
}
