//
//  64.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    var matrix: [[Int]] = grid
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            matrix[i][j] = 0
        }
    }
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if i == 0 && j == 0 {
                matrix[i][j] = grid[i][j]
            } else {
                if i == 0 {
                    matrix[i][j] = matrix[i][j - 1] + grid[i][j]
                }
                if j == 0 {
                    matrix[i][j] = matrix[i - 1][j] + grid[i][j]
                }
                if i > 0 && j > 0 {
                    matrix[i][j] = min(matrix[i - 1][j], matrix[i][j - 1]) + grid[i][j]
                }
            }
        }
    }
    return matrix[matrix.count - 1][matrix[0].count - 1]
}
