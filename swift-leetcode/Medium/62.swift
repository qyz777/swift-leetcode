//
//  62.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var matrix: [[Int]] = []
    for _ in 0..<n {
        var array: [Int] = []
        for _ in 0..<m {
            array.append(0)
        }
        matrix.append(array)
    }
    for i in 0..<n {
        for j in 0..<m {
            if i == 0 || j == 0 {
                matrix[i][j] = 1
            } else {
                matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
            }
        }
    }
    return matrix[n - 1][m - 1]
}
