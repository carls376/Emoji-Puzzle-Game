//
//  PuzzleDataRepository.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/17/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import Foundation

class PuzzleDataRepository : PuzzleRepository {
    
    fileprivate var puzzles : [Puzzle] = [
        Puzzle.init(description: "test", answer: "test"),
        Puzzle.init(description: "another test", answer: "test")
    ]
    
    func getPuzzles() -> [Puzzle] {
        return puzzles
    }
}
