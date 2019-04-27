//
//  36.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var cols: [Int: [Character: Int]] = [:]
    var g1: [Character: Int] = [:]
    var g2: [Character: Int] = [:]
    var g3: [Character: Int] = [:]
    for i in 0..<9 {
        if i % 3 == 0 {
            g1 = [:]
            g2 = [:]
            g3 = [:]
        }
        var row: [Character: Int] = [:]
        for j in 0..<9 {
            if board[i][j] == "." {
                continue
            }
//            列
            if cols[j] == nil {
                cols[j] = [board[i][j]: 1]
            } else {
                var col = cols[j]!
                if col[board[i][j]] != nil {
                    return false
                }
                col[board[i][j]] = 1
                cols[j] = col
            }
//            行
            if row[board[i][j]] == nil {
                row[board[i][j]] = 1
            } else {
                return false
            }
//            格
            if j < 3 {
                if g1[board[i][j]] == nil {
                    g1[board[i][j]] = 1
                } else {
                    return false
                }
            } else if j < 6 {
                if g2[board[i][j]] == nil {
                    g2[board[i][j]] = 1
                } else {
                    return false
                }
            } else {
                if g3[board[i][j]] == nil {
                    g3[board[i][j]] = 1
                } else {
                    return false
                }
            }
        }
    }
    return true
}
