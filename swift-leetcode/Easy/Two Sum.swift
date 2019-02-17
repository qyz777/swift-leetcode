//
//  Two Sum.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var array: [Int] = []
    for i in 0..<nums.count {
        let firstNum = nums[i]
        if i + 1 < nums.count {
            for j in (i+1)..<nums.count {
                let secondNum = nums[j]
                if firstNum + secondNum == target {
                    array.append(i)
                    array.append(j)
                }
            }
        }
    }
    return array
}
