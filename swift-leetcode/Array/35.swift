//
//  35.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 就是二分搜索呢
 
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var i = 0
    var j = nums.count - 1
    while i < j {
        let mid = i + (j - i) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            i = mid + 1
        } else {
            j = mid
        }
    }
    return i
}
