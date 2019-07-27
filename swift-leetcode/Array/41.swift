//
//  41.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的空间。
 头大😒
 
 这道题真没想出来怎么解，参考官方题解
 https://leetcode-cn.com/problems/first-missing-positive/solution/que-shi-de-di-yi-ge-zheng-shu-by-leetcode/
 
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    var c = 0
    for i in 0..<nums.count {
        if nums[i] == 1 {
            c += 1
            break
        }
    }
    if c == 0 {
        return 1
    }
    if nums.count == 1 {
        return 2
    }
    for i in 0..<nums.count {
        if nums[i] <= 0 || nums[i] > nums.count {
            nums[i] = 1
        }
    }
    for i in 0..<nums.count {
        let a = abs(nums[i])
        if a == nums.count {
            nums[0] = -abs(nums[0])
        } else {
            nums[a] = -abs(nums[a])
        }
    }
    for i in 1..<nums.count {
        if nums[i] > 0 {
            return i
        }
    }
    if nums[0] > 0 {
        return nums.count
    }
    return nums.count + 1
}
