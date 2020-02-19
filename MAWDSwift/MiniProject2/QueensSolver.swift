//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var printCnt = 0
func solve8Queens(board: inout Board) {
    solve8QueensHelper(board: &board, row: 0)
//    print("Number of recursive calls: \(count)")
}
func solve8QueensHelper(board: inout Board, row: Int) {
	count += 1
    
    for col in 0...7 {
        // row 0 to 7
        if board.isSafe(row: row, col: col) {
            board.place(row: row, col: col)
            if row != 7 {
                solve8QueensHelper(board: &board, row: row + 1)
            }
            if row == 7 {
                printCnt += 1
                print("Solution Number: \(printCnt)")
                print(board)
                print("Number of recursive calls: \(count)")
                print()
            }
            board.remove(row: row, col: col)
        }
    }
}

