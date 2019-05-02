//
//  279.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 f(n) = 1 + min(f(n-1^2), f(n-2^2), f(n-3^2), f(n-4^2), ... , f(n-k^2))
 */

func numSquares(_ n: Int) -> Int {
    var dp: [Int] = Array.init(repeating: 0, count: n + 1)
    for i in 1...n {
        var minValue = Int.max
        var j = 1
        while j * j <= i {
            minValue = min(minValue, dp[i - j * j])
            j += 1
        }
        dp[i] = minValue + 1
    }
    return dp.last!
}
