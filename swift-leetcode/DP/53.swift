//
//  53.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 入门级动态规划
 递推公式: dp[i] = max(dp[i - 1] + nums[i], nums[i])
 这个题目因为不需要保存之前的状态，所以可以用一个tempSum代替dp数组
 
 */

func maxSubArray(_ nums: [Int]) -> Int {
    var tempSum = 0
    var maxSum: Int?
    for num in nums {
        tempSum = max(tempSum + num, num)
        if maxSum == nil {
            maxSum = tempSum
        } else {
            if tempSum > maxSum! {
                maxSum = tempSum
            }
        }
    }
    return maxSum ?? 0
}
