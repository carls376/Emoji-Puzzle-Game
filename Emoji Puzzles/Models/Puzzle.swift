//
//  Puzzle.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/14/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import Foundation

struct Puzzle {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
