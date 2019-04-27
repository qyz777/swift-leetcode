//
//  Two Sum.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var info: [Int: Int] = [:]
    for i in 0..<nums.count {
        if info[nums[i]] == nil {
            info[target - nums[i]] = i
        } else {
            return [info[nums[i]]!, i]
        }
    }
    return []
}
