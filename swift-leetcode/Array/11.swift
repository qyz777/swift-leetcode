//
//  11.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    guard height.count > 1 else {
        return 0
    }
    var left = 0
    var right = height.count - 1
    var res = Int.min
    while left < right {
        let minHeight = min(height[left], height[right])
        let area = minHeight * (right - left)
        if area > res {
            res = area
        }
        if height[left] < height[right] {
            left += 1
        } else if height[left] > height[right] {
            right -= 1
        } else {
            left += 1
            right -= 1
        }
    }
    return res
}
