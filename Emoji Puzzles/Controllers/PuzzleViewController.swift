//
//  PuzzleViewController.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/14/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var correctAnswers: Int = 0
    var puzzles: [Puzzle]!
    var currentPuzzleIndex: Int = 0
    var currentPuzzle: Puzzle! {
        didSet {
            self.updateViewForNewPuzzle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.puzzles = PuzzleDataRepository().getPuzzles()
        self.currentPuzzle = self.puzzles[self.currentPuzzleIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? GameOverViewController
        {
            vc.correctAnswers = self.correctAnswers
        }
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        if self.answerTextField.text?.lowercased() == self.currentPuzzle?.answer.lowercased() {
            // correct answer
            self.correctAnswers += 1
            self.presentResult(title: "Correct!")
        } else {
            // incorrect answer
            self.presentResult(title: "Incorrect!")
        }
    }
    
    private func presentResult(title: String) {
        let alertController = UIAlertController(title: title, message: "\(self.currentPuzzle.answer) is the correct answer", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Next", style: .default, handler: { alert in self.setNextPuzzle() })
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    private func setNextPuzzle() {
        self.currentPuzzleIndex += 1
        
        if self.currentPuzzleIndex < self.puzzles.count {
            self.currentPuzzle = self.puzzles[self.currentPuzzleIndex]
        } else {
            self.endGame()
        }
    }
    
    private func updateViewForNewPuzzle() {
        self.emojiLabel.text = self.currentPuzzle.question
        self.answerTextField.text = ""
    }
    
    private func endGame() {
        performSegue(withIdentifier: "gameOverSegue", sender: nil)
        
        // reset game
        self.correctAnswers = 0
        self.currentPuzzleIndex = 0
        self.currentPuzzle = self.puzzles[self.currentPuzzleIndex]
    }
    
}
