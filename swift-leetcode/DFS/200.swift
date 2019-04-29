//
//  200.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    func _DFS(_ grid: inout [[Character]], _ x: Int, _ y: Int) {
        guard x < grid.count && y < grid[0].count else {
            return
        }
        grid[x][y] = Character("e")
        let X = [-1, 1, 0, 0]
        let Y = [0, 0, -1, 1]
        for i in 0..<4 {
            let mX = x + X[i]
            let mY = y + Y[i]
            if (mX >= 0 && mX < grid.count) && (mY >= 0 && mY < grid[0].count) {
                if grid[mX][mY] == "1" {
                    _DFS(&grid, mX, mY)
                }
            }
        }
    }
    var g = grid
    var count = 0
    for i in 0..<g.count {
        for j in 0..<g[0].count {
            if g[i][j] == "1" {
                count += 1
                _DFS(&g, i, j)
            }
        }
    }
    return count
}
