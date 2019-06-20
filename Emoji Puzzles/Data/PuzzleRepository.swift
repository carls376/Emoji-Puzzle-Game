//
//  PuzzleRepository.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/17/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import Foundation

protocol PuzzleRepository {
    var curPuzzleIndex: Int { get set }
    func getNextPuzzle() -> Puzzle!
    func answerIsCorrect(answer : String) -> Bool
}
