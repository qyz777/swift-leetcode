//
//  268.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    guard nums.count > 0 else {
        return 1
    }
    var sum = (1 + nums.count) * nums.count / 2
    for n in nums {
        sum -= n
    }
    return sum
}
