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
    
    var curPuzzleIndex: Int = -1
    
    func getNextPuzzle() -> Puzzle! {
        self.curPuzzleIndex += 1
        if self.curPuzzleIndex >= self.puzzles.count {
            self.curPuzzleIndex = -1 // reset
            return nil
        }
        
        return self.puzzles[self.curPuzzleIndex]
    }
    
    func answerIsCorrect(answer: String) -> Bool {
        if let curPuzzle = self.getCurPuzzle() {
            if (answer.lowercased() == curPuzzle.answer.lowercased()) {
                return true
            }
        }
        
        return false
    }
    
    private func getCurPuzzle() -> Puzzle! {
        if self.curPuzzleIndex >= self.puzzles.count {
            return nil
        }
        
        return self.puzzles[self.curPuzzleIndex]
    }
}
