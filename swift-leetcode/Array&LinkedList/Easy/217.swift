//
//  217.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var info: [Int: Int] = [:]
    for num in nums {
        if info[num] == nil {
            info[num] = 1
        } else {
            return true
        }
    }
    return false
}
