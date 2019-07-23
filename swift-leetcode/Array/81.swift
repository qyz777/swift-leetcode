//
//  81.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/23.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 参考https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii/solution/er-fen-by-powcai/
 
 */

func search_2(_ nums: [Int], _ target: Int) -> Bool {
    guard nums.count > 0 else {
        return false
    }
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            return true
        }
        if nums[left] == nums[mid] && nums[mid] == nums[right] {
            left += 1
            right -= 1
        } else if nums[left] <= nums[mid] {
            if nums[left] <= target && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return false
}
