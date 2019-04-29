//
//  63.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    guard obstacleGrid.count > 0 else {
        return 0
    }
    var dp = obstacleGrid
    for i in (0..<dp.count).reversed() {
        for j in (0..<dp[0].count).reversed() {
            if obstacleGrid[i][j] == 1 {
                dp[i][j] = 0
                continue
            }
            if i + 1 > dp.count - 1 && j + 1 > dp[0].count - 1 {
                dp[i][j] = 1
            } else if i + 1 > dp.count - 1 {
                dp[i][j] = dp[i][j + 1] == 0 ? 0 : 1
            } else if j + 1 > dp[0].count - 1 {
                dp[i][j] = dp[i + 1][j] == 0 ? 0 : 1
            } else {
                dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
            }
        }
    }
    return dp[0][0]
}
