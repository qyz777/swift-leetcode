//
//  264.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func nthUglyNumber(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    var dp = [1]
    var i2 = 0
    var i3 = 0
    var i5 = 0
    var index = 1
    while index < n {
        let val = min(dp[i2] * 2, dp[i3] * 3, dp[i5] * 5)
        dp.append(val)
        if dp[i2] * 2 == val {
            i2 += 1
        }
        if dp[i3] * 3 == val {
            i3 += 1
        }
        if dp[i5] * 5 == val {
            i5 += 1
        }
        index += 1
    }
    return dp.last!
}
