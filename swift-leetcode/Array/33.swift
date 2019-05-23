//
//  33.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 题目说了算法时间复杂度必须是 O(log n) 级别...
 
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    func _search(_ left: Int, _ right: Int) -> Int {
        if left > right {
            return -1
        }
        let mid = (left + right) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < nums[right] {
            if nums[mid] < target && target <= nums[right] {
                return _search(mid + 1, right)
            } else {
                return _search(left, mid - 1)
            }
        } else {
            if nums[left] <= target && target < nums[mid] {
                return _search(left, mid - 1)
            } else {
                return _search(mid + 1, right)
            }
        }
    }
    return _search(0, nums.count - 1)
}
