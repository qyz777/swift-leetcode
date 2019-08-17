//
//  162.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 因为nums[i] ≠ nums[i+1]
 所以峰值比较只需要判断nums[i] > nums[i + 1]即可，不然i-1比i大的话直接返回i-1就行了
 
 */

func findPeakElement(_ nums: [Int]) -> Int {
    for i in 0..<nums.count - 1 {
        if nums[i] > nums[i + 1] {
            return i
        }
    }
    return nums.count - 1
}
