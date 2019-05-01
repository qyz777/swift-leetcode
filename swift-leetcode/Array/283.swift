//
//  283.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var i = 0
    var index = 0
    while index < nums.count {
        let num = nums[i]
        if num == 0 {
            nums.remove(at: i)
            nums.append(0)
        } else {
            i += 1
        }
        index += 1
    }
}
