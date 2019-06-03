//
//  740.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 dp含义为dp的下标为num中元素的取值，dp[n]为元素的个数
 
 转移方程为dp[i] = max(dp[i - 2] + dp[i] * i, dp[i - 1])
 下一个最大点数 = max(i - 2个的点数 + 当前点数*当前点数的数量, 上一个最大点数)
 取前者说明当前选了nums[i]，删除nums[i - 1]可以获得当前点数的最大值
 选后者说明选了nums[i]还不如不选，所以取dp[i - 1]
 
 */

func deleteAndEarn(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var dp = Array.init(repeating: 0, count: 10001)
    for n in nums {
        dp[n] += 1
    }
    for i in 2..<10001 {
        dp[i] = max(dp[i - 2] + dp[i] * i, dp[i - 1])
    }
    return dp.last!
}
