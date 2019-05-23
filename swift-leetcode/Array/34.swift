//
//  34.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/23.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 题目要求算法时间复杂度必须是 O(log n) 级别
 其实这道题比33简单很多，因为只要用二分查找的方法查找到最左和最右那两个，但是我一不小心没写出O(log n)...
 下面是一个标准的做法
 

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count  != 0 else {
        return [-1, -1]
    }
    
    var left = 0, right = nums.count - 1
    var l = -1, r = -1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            r = mid
            left = mid + 1 ⭐️
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    left = 0; right = nums.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            l = mid
            right = mid - 1 ⭐️
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return [l, r]
}
 
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else {
        return [-1, -1]
    }
    func _findTarget(_ leftIndex: inout Int, _ rightIndex: inout Int, _ left: Int, _ right: Int) {
        if left > right {
            return
        }
        let mid = (left + right) / 2
        if nums[mid] == target {
            leftIndex = min(leftIndex, mid)
            rightIndex = max(rightIndex, mid)
        }
        _findTarget(&leftIndex, &rightIndex, mid + 1, right)
        _findTarget(&leftIndex, &rightIndex, left, mid - 1)
    }
    var left = Int.max
    var right = Int.min
    _findTarget(&left, &right, 0, nums.count - 1)
    if left == Int.max || right == Int.min {
        return [-1, -1]
    }
    return [left, right]
}
