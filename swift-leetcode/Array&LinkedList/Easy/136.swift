//
//  136.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var info: [Int: Int] = [:]
    for num in nums {
        if info[num] == nil {
            info[num] = 1
        } else {
            info.removeValue(forKey: num)
        }
    }
    return info.first!.key
}

//func singleNumber(_ nums: [Int]) -> Int {
//    var result = 0
//
//    for num in nums {
//        result ^= num // 异或，result 与相同的元素异或两次，值不变
//    }
//
//    return result
//}
