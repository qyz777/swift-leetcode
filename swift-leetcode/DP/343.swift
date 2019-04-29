//
//  343.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/19.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//ref: https://blog.csdn.net/qq874455953/article/details/83686522

func integerBreak(_ n: Int) -> Int {
    guard n > 2 else {
        return 1
    }
    var dp: [Int] = [1, 1]
    for i in 2...n {
        dp.append(-1)
        for j in 0..<i {
            dp[i] = max(dp[i], j * (i - j), j * dp[i - j])
        }
    }
    return dp.last!
}
