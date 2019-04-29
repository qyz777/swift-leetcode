//
//  152.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var lastT = (nums.first!, nums.first!)
    var res = nums.first!
    for i in 1..<nums.count {
        let n = nums[i]
        let x = max(lastT.0 * n, lastT.1 * n, n)
        let y = min(lastT.0 * n, lastT.1 * n, n)
        lastT = (x, y)
        res = max(x, y, res)
    }
    return res
}
