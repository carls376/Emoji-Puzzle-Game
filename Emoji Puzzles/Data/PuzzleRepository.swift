//
//  PuzzleRepository.swift
//  Emoji Puzzles
//
//  Created by Brendan Carlson on 6/17/19.
//  Copyright © 2019 Brendan Carlson. All rights reserved.
//

import Foundation

protocol PuzzleRepository {
    func getPuzzles() -> [Puzzle]
}
