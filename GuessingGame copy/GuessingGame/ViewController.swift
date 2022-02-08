//
//  ViewController.swift
//  GuessingGame
//
//  Created by Jane Schmidt on 2/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numOfGuessesLabel: UILabel!
    @IBOutlet var lastGuessLabl: UILabel!
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var guessButton: UIButton!
    @IBOutlet var letterOccurrenceLabel: UILabel!
    @IBOutlet var textInput: UITextField!
    
    var myModel = GuessingGameModel()
    var guess = ""
    var count = 0
    var running = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.guessButton.isEnabled = false
        self.textInput.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func beginGame(_ sender: Any){
        if(running == true){
            self.startGameButton.setTitle("Begin New Game", for: .normal)
            self.startGameButton.backgroundColor = UIColor.blue
            self.guessButton.isEnabled = false
            self.textInput.isEnabled = false
            running = false
            
        }
        else{
            running = true
            count = 0
            self.lastGuessLabl.backgroundColor = UIColor.lightGray
            self.guessButton.isEnabled = true
            self.textInput.isEnabled = true
            self.startGameButton.backgroundColor = UIColor.red
            self.startGameButton.setTitle("End Game", for: .normal)
            self.numOfGuessesLabel.text = ""
            self.lastGuessLabl.text = ""
            self.letterOccurrenceLabel.text = ""
        }

    }
    
    @IBAction func textSubmitAction(_ sender: Any){
        count+=1
        self.numOfGuessesLabel.text = String(count)
        self.guess = self.textInput.text ?? ""
        self.textInput.text = ""
        self.lastGuessLabl.text = self.guess
        self.guess = self.guess.lowercased()
        var correct = myModel.checkIfCorrect(guess: self.guess)
        if(correct){
            self.startGameButton.setTitle("Begin New Game", for: .normal)
            self.startGameButton.backgroundColor = UIColor.blue
            self.lastGuessLabl.backgroundColor = UIColor.green
            self.guessButton.isEnabled = false
            self.textInput.isEnabled = false
            running = false
            }
        else{
        
        }
        self.letterOccurrenceLabel.text = String(myModel.checkForLetters(guess: self.guess))
    }



}

