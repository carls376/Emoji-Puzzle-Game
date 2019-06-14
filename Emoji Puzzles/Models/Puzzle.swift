//
//  Puzzle.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/14/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import Foundation

struct Puzzle {
    var description: String
    var answer: String
    
    init(description: String, answer: String) {
        self.description = description
        self.answer = answer
    }
}
