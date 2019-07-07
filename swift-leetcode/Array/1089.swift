//
//  1089.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/7.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 注意数组长度要跟原来一样
 
 */

func duplicateZeros(_ arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        if arr[i] == 0 {
            arr.insert(0, at: i)
            arr.removeLast()
            i += 2
        } else {
            i += 1
        }
    }
}
