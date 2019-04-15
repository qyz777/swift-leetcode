//
//  198.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    guard nums.count > 1 else {
        return nums[0]
    }
    guard nums.count > 2 else {
        return max(nums[0], nums[1])
    }
    var dp: [Int] = [nums[0], max(nums[0], nums[1])]
    for i in 2..<nums.count {
        dp.append(max(dp[i - 1], nums[i] + dp[i - 2]))
    }
    return dp.last!
}
