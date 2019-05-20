//
//  42.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/20.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 Review Level: ⭐️⭐️
 
 每个位置上积水的高度，应该等于 min（左边最高的柱子高度，右边最高的柱子高度）- 这个位置上的柱子高度。
 
 */

func trap(_ height: [Int]) -> Int {
    guard height.count > 0 else {
        return 0
    }
    var left = Array.init(repeating: 0, count: height.count)
    var right = Array.init(repeating: 0, count: height.count)
    for i in 1..<height.count {
        left[i] = max(left[i - 1], height[i - 1])
    }
    for i in (0..<height.count - 1).reversed() {
        right[i] = max(right[i + 1], height[i + 1])
    }
    var res = 0
    for i in 0..<height.count {
        res += max(0, min(left[i], right[i]) - height[i])
    }
    return res
}
