//
//  416.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 ref comment
 * 背包问题：看数组中是否存在加起来为sum/2的数.
 * 背包容量（V） = sum/2
 * 每一个物品只能装一次,如果出现背包中重量等于sum/2则为true else false
 * dp[i]表示能否填满容量为i的背包
 * 状态转移方程为 dp[i] = dp[i-1] || nums[i]+dp[i-nums[j]]
 * 举例:v = sum/2 = 11   nums = [1,5,11,5]  1是true 0 是false
 *          0  1  2  3  4  5  6  7  8  9  10  11
 *  nums[0] 0  1  0  0  0  0  0  0  0  0   0   0
 *  nums[1] 0  1  0  0  0  1  1  0  0  0   0   0
 *  nums[2] 0  1  0  0  0  1  1  0  0  0   0   1
 *  nums[3] 0  1  0  0  0  1  1  0  0  0   0   1
 *
 * 所以返回true，因为背包中nums[i]的状态都是由上一行决定的因此可以将二维转化为1维数组从尾部开始
 */

func canPartition(_ nums: [Int]) -> Bool {
    var sum = 0
    for num in nums {
        sum += num
    }
    guard sum % 2 == 0 else {
        return false
    }
    let mid = sum / 2
    var dp: [Bool] = Array.init(repeating: false, count: mid + 1)
    for i in 0...mid {
        dp[i] = nums[0] == i
    }
    for i in 1..<nums.count {
        var j = mid
        while j >= nums[i] {
            dp[j] = dp[j] || dp[j - nums[i]]
            j -= 1
        }
    }
    return dp[mid]
}
