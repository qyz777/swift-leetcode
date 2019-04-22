//
//  18.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count > 3 else {
        return []
    }
    var res: Set<[Int]> = []
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            let twoTarget = target - nums[i] - nums[j]
            var info: [Int: Int] = [:]
            for k in j+1..<nums.count {
                if info[nums[k]] == nil {
                    info[twoTarget - nums[k]] = 1
                } else {
                    res.insert([nums[i], nums[j], twoTarget - nums[k], nums[k]].sorted())
                }
            }
        }
    }
    return Array(res)
}
