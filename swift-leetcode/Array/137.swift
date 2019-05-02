//
//  137.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//func singleNumber(_ nums: [Int]) -> Int {
//    var a = 0, b = 0
//    nums.forEach { (element) in
//        b = (b ^ element) & ~a
//        a = (a ^ element) & ~b
//    }
//    return b
//}

func singleNumber2(_ nums: [Int]) -> Int {
    var info: [Int: Int] = [:]
    for n in nums {
        if info[n] == nil {
            info[n] = 1
        } else {
            info[n] = info[n]! + 1
        }
    }
    var res = nums[0]
    for (k, v) in info {
        if v == 1 {
            res = k
        }
    }
    return res
}
