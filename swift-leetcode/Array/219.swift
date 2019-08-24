//
//  219.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/24.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 注意题目意思`绝对值最大为 k`要你找的是小于等于k的绝对值之差，这个真坑人
 
 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var info: [Int: Int] = [:] // key是nums的value，value是nums的index
    for i in 0..<nums.count {
        if info[nums[i]] == nil {
            info[nums[i]] = i
        } else {
            if abs(i - info[nums[i]]!) <= k {
                return true
            } else if abs(i - info[nums[i]]!) > k {
                //大于k说明就要存相同值的新的下标了，这样才有机会找到下标之差小于等于k的值
                info[nums[i]] = i
            }
        }
    }
    return false
}
