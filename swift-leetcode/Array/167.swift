//
//  167.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题因为是有序数组，所以可以不用Map，用双指针从左右两边逼近即可。
 
 */

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum == target {
            return [left + 1, right + 1]
        } else if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        }
    }
    return []
}
