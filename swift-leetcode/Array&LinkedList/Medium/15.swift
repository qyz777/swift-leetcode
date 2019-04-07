//
//  15.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else {
        return []
    }
    var res: Set<[Int]> = []
    for i in 0..<nums.count {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        var info: [Int: Int] = [:]
        for j in i+1..<nums.count {
            if info[nums[j]] != nil {
                res.insert([nums[i], -nums[i] - nums[j], nums[j]].sorted())
            } else {
                info[-nums[i] - nums[j]] = 1
            }
        }
    }
    return Array(res)
}
