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
        Puzzle.init(question: "🌎🐵🙈🙉🙊🐒", answer: "Planet of the Apes"),
        Puzzle.init(question: "👰💁‍♀️🙅‍♀️🤦‍♀️🤷‍♀️", answer: "Bridesmaids")
    ]
    
    func getPuzzles() -> [Puzzle] {
        return puzzles
    }
}
