//
//  80.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/23.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 双指针把超过2个的元素都移除出数组
 时间复杂度为O(n²)，感觉太慢了，不如直接计数快
 
 */

func removeDuplicates_2(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return nums.count
    }
    var i = 0
    var j = 1
    while j < nums.count {
        if nums[j] == nums[i] && j + 1 < nums.count && nums[j + 1] == nums[i] {
            //超过2个了移除
            nums.remove(at: j + 1)
        } else {
            //下一组元素
            i = j
            j += 1
        }
    }
    return nums.count
}
