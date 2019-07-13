//
//  300.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 最长上升子序列
 递推公式: dp[i] = max(dp[0]...dp[i - 1]) + 1 || 1
 其中dp[i]表示nums[i]的最长子序列长度
 
 */

func lengthOfLIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var dp: [Int] = []
    var maxLength = 1
    for i in 0..<nums.count {
        dp.append(1)
        for j in 0..<i {
            if nums[i] > nums[j] && dp[j] >= dp[i] {
                dp[i] = dp[j] + 1
                maxLength = max(dp[i], maxLength)
            }
        }
    }
    return maxLength
}
