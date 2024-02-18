//
//  Game.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 19.02.2024.
//

import Foundation

protocol GameProtocol {
    var score : Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateSCORE(with value: Int)
}

