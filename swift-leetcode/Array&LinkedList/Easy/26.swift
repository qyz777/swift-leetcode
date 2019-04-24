//
//  26.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/24.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    var i = 0
    while i < nums.count {
        let pre = nums[i]
        var j = i + 1
        while j < nums.count {
            let next = nums[j]
            if pre == next {
                nums.remove(at: j)
            } else {
                j += 1
            }
        }
        i += 1
    }
    return nums.count
}
