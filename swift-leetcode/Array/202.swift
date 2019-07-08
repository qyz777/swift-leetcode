//
//  202.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 如果无限循环中又循环到了之前出现过的，那么就可以停止了
 
 */

func isHappy(_ n: Int) -> Bool {
    var info: [Int: Int] = [:]
    var num = n
    while info[num] == nil {
        info[num] = 1
        var res = 0
        let array = Array(String(num))
        for c in array {
            res += Int(powf(Float(Int(String(c))!), 2))
        }
        if res == 1 {
            return true
        } else {
            num = res
            res = 0
        }
    }
    return false
}
