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
    
    let puzzleRepo : PuzzleRepository = PuzzleDataRepository()
    
    var correctAnswers: Int = 0
    var curPuzzle: Puzzle! {
        didSet {
            self.updateViewForNewPuzzle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answerTextField.addTarget(self, action: #selector(answerTextFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setNextPuzzle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? GameOverViewController
        {
            vc.correctAnswers = self.correctAnswers
        }
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        if self.puzzleRepo.isCorrectAnswer(self.answerTextField.text!) {
            self.correctAnswers += 1
            self.presentResult(title: "Correct!")
        } else {
            self.presentResult(title: "Incorrect!")
        }
    }
    
    private func presentResult(title: String) {
        let alertController = UIAlertController(title: title, message: "\(self.curPuzzle.answer) is the correct answer", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Next", style: .default, handler: { alert in self.setNextPuzzle() })
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    private func updateViewForNewPuzzle() {
        self.emojiLabel.text = self.curPuzzle?.question
        self.answerTextField.text = ""
        self.submitButton.isEnabled = false
    }
    
    @objc private func answerTextFieldDidChange() {
        guard let text = self.answerTextField.text, !text.isEmpty else {
            self.submitButton.isEnabled = false
            return
        }
        
        self.submitButton.isEnabled = true
    }
    
    private func setNextPuzzle() {
        guard let nextPuzzle = self.puzzleRepo.getNextPuzzle() else {
            self.endGame()
            return
        }
        self.curPuzzle = nextPuzzle
    }
    
    private func endGame() {
        performSegue(withIdentifier: "gameOverSegue", sender: nil)
        
        // reset
        self.correctAnswers = 0
    }
    
}
