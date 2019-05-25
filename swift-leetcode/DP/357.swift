//
//  357.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/25.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 转移方程: dp[i] = dp[i - 1]+(dp[i - 1] - dp[i - 2]) * (10 - (i - 1));
 dp[i - 1]为上一个数字
 dp[i - 1] - dp[i - 2]的意思是上一步判断各位不重复的数字数量
 * (10 - (i - 1))意思是有(10 - (i - 1))与前面几位不同的选取方法
 
 */

func countNumbersWithUniqueDigits(_ n: Int) -> Int {
    guard n > 0 else {
        return 1
    }
    guard n > 1 else {
        return 10
    }
    var dp = [1, 10]
    for i in 2...n {
        dp.append(dp[i - 1] + (dp[i - 1] - dp[i - 2]) * (10 - (i - 1)))
    }
    return dp.last!
}
