//
//  GameOverViewController.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/17/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    
    var correctAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsLabel.text = "Game Over. You got \(self.correctAnswers) answers correct"
    }
    
    @IBAction func startOver(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
