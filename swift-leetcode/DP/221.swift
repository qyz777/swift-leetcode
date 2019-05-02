//
//  221.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0 else {
        return 0
    }
    var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: matrix.first!.count), count: matrix.count)
    var res = 0
    for i in 0..<matrix.count {
        for j in 0..<matrix.first!.count {
            if i == 0 || j == 0 {
                dp[i][j] = matrix[i][j] == "1" ? 1 : 0
            } else {
                if matrix[i][j] == "1" {
                    dp[i][j] = 1
                    if matrix[i - 1][j] == "1" &&
                        matrix[i][j - 1] == "1" &&
                        matrix[i - 1][j - 1] == "1" {
                        dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
                    }
                }
            }
            res = max(res, dp[i][j])
        }
    }
    return res * res
}
