//
//  79.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    func _DFS(_ isExist: inout Bool, _ board: [[Character]], _ word: String, _ x: Int, _ y: Int, _ path: [String: Int]) {
        guard !isExist else {
            return
        }
        if word.count == 0 {
            isExist = true
            return
        } else {
            var tempWord = word
            var tempPath = path
            let c = tempWord.removeFirst()
//            上
            if x - 1 >= 0 && board[x - 1][y] == c && tempPath["\(x - 1),\(y)"] == nil  {
                tempPath["\(x - 1),\(y)"] = 1
                _DFS(&isExist, board, tempWord, x - 1, y, tempPath)
                tempPath.removeValue(forKey: "\(x - 1),\(y)")
            }
//            右
            if y + 1 < board[0].count && board[x][y + 1] == c && tempPath["\(x),\(y + 1)"] == nil {
                tempPath["\(x),\(y + 1)"] = 1
                _DFS(&isExist, board, tempWord, x, y + 1, tempPath)
                tempPath.removeValue(forKey: "\(x),\(y + 1)")
            }
//            下
            if x + 1 < board.count && board[x + 1][y] == c && tempPath["\(x + 1),\(y)"] == nil {
                tempPath["\(x + 1),\(y)"] = 1
                _DFS(&isExist, board, tempWord, x + 1, y, tempPath)
                tempPath.removeValue(forKey: "\(x + 1),\(y)")
            }
//            左
            if y - 1 >= 0 && board[x][y - 1] == c && tempPath["\(x),\(y - 1)"] == nil {
                tempPath["\(x),\(y - 1)"] = 1
                _DFS(&isExist, board, tempWord, x, y - 1, tempPath)
                tempPath.removeValue(forKey: "\(x),\(y - 1)")
            }
        }
    }
    var isExist = false
    var tempWord = word
    let c = tempWord.removeFirst()
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == c {
                _DFS(&isExist, board, tempWord, i, j, ["\(i),\(j)": 1])
                if isExist {
                    return isExist
                }
            }
        }
    }
    return isExist
}
