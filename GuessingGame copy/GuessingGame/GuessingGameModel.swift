//
//  GuessingGameModel.swift
//  GuessingGame
//
//  Created by Jane Schmidt on 2/8/22.
//

import Foundation

class GuessingGameModel{
let actual = "dolphin"
    
    func checkForLetters(guess: String) -> Int {
        var letterOccurances = 0
        for x in guess {
            for y in self.actual{
                if x == y{
                    letterOccurances += 1
                    break
                }
            }
        }
        return(letterOccurances)
    }
    
    func checkIfCorrect(guess: String) -> Bool {
        if (guess == self.actual){
            return(true)
        }
        return(false)
    }
    
    
}
