//
//  409.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func longestPalindrome(_ s: String) -> Int {
    var info: [Character: Int] = [:]
    var result = 0
    for c in s {
        if info[c] == nil {
            info[c] = 1
        } else {
            info[c] = info[c]! + 1
        }
    }
    for (k, v) in info {
        if v % 2 == 0 {
            result += v
            info.removeValue(forKey: k)
        } else {
            if v - 1 > 1 {
                result += v - 1
                info[k] = 1
            }
        }
    }
    return info.count > 0 ? result + 1 : result
}
