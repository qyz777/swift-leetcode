//
//  169.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var info: [Int: Int] = [:]
    for n in nums {
        if info[n] == nil {
            info[n] = 1
        } else {
            info[n] = info[n]! + 1
        }
    }
    var maxK = info.first!.key
    var maxV = info.first!.value
    for (k, v) in info {
        if v >= maxV {
            maxK = k
            maxV = v
        }
    }
    return maxK
}
