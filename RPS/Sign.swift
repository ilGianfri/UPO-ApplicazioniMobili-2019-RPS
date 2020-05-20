//
//  Sign.swift
//  RPS
//
//  Created by Alessandro Spisso on 18/05/2020.
//  Copyright © 2020 Alessandro Spisso. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign {
    case Rock
    case Paper
    case Scissors
    
    //To get the emoji
    var EmojiSign: String {
        switch self {
        case .Paper:
            return "🤚"
        case .Rock:
            return "👊"
        case .Scissors:
            return "✌️"
        }
    }
    
    //Given an opponent Sign, returns a GameState
    func GetState(OpponentSign: Sign) -> GameState {
    switch self {
    case .Rock:
        switch OpponentSign {
        case .Rock:
            return GameState.Draw
        case .Paper:
            return GameState.Lose
        case .Scissors:
            return GameState.Win
        }
    case .Scissors:
        switch OpponentSign {
        case .Rock:
            return GameState.Lose
        case .Paper:
            return GameState.Win
        case .Scissors:
            return GameState.Draw
        }
    case .Paper:
        switch OpponentSign {
        case .Rock:
            return GameState.Win
        case .Paper:
            return GameState.Draw
        case .Scissors:
            return GameState.Lose
        }
        }
    }
}

//Returns a random Sign
func RandomSign() -> Sign {
    //Random number between 0 and 2 (included)
    let sign = randomChoice.nextInt()
    
    switch sign {
        case 0: return .Rock
        case 1: return .Paper
        case 2: return .Scissors
    default:
        return .Rock
    }
}
