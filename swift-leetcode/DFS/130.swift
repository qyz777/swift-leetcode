//
//  130.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/16.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 如何判断O被X围绕
 
 参考至评论的做法，从四个边开始与之关联的肯定不被围绕，置位"-"
 然后重新遍历把"-"置位O，因为这些不会被围绕，把O置位X，因为这些是围绕的
 
 */

func solve(_ board: inout [[Character]]) {
    guard board.count > 0 else {
        return
    }
    func _dfs(_ x: Int, _ y: Int) {
        guard x >= 0 && y >= 0 && x < board.count && y < board.first!.count && board[x][y] == "O" else {
            return
        }
        board[x][y] = "-"
        let X = [-1, 1, 0, 0]
        let Y = [0, 0, 1, -1]
        for i in 0..<4 {
            //四个方向dfs找出关联的为O的元素置位"-"
            _dfs(x + X[i], y + Y[i])
        }
    }
    for i in 0..<board.count {
        _dfs(i, 0)//左
        _dfs(i, board.first!.count - 1)//右
    }
    for i in 0..<board.first!.count {
        _dfs(0, i)//上
        _dfs(board.count - 1, i)//下
    }
    for i in 0..<board.count {
        for j in 0..<board.first!.count {
            if board[i][j] == "-" {
                board[i][j] = "O"
            } else if board[i][j] == "O" {
                board[i][j] = "X"
            }
        }
    }
}
