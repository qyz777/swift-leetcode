//
//  120.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
        return 0
    }
    var dp = triangle.last!
    for i in (0..<triangle.count - 1).reversed() {
        var line = triangle[i]
        for j in 0..<line.count {
            var minNum = dp[j]
            if j + 1 < dp.count && dp[j + 1] < minNum {
                minNum = dp[j + 1]
            }
            line[j] += minNum
        }
        dp = line
    }
    return dp.first!
}
