//
//  153.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/23.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 二分搜索，改造一下找出一个比左边和右边都小的值就是答案
 
 */

func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    guard nums.count > 1 else {
        return nums.first!
    }
    var left = 0
    var right = nums.count - 1
    //判断是否旋转，没旋转返回第一个即可
    if nums[right] > nums.first! {
        return nums.first!
    }
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] > nums[mid + 1] {
            //升序mid大于右边，说明右边是答案
            return nums[mid + 1]
        } else if nums[mid - 1] > nums[mid] {
            //左边大于mid说明mid是答案
            return nums[mid]
        }
        if nums[mid] > nums[0] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}
