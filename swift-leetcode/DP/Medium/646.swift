//
//  646.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findLongestChain(_ pairs: [[Int]]) -> Int {
    var dp: [Int] = []
    var maxLength = 0
    let pairs = pairs.sorted { (a, b) -> Bool in
        return a[0] + a[1] < b[0] + b[1]
    }
    for i in 0..<pairs.count {
        dp.append(1)
        for j in 0..<i {
            if pairs[i][0] > pairs[j][1] && dp[i] <= dp[j] {
                dp[i] = dp[j] + 1
            }
        }
        maxLength = max(dp[i], maxLength)
    }
    return maxLength
}
