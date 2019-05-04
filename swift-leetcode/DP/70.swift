//
//  70.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 动态规划都是难点好吗！！！🤦‍♂️
 
 这题也是我在腾讯面试的时候的被问到的原题
 
 */

func climbStairs(_ n: Int) -> Int {
    guard n != 1 else {
        return 1
    }
    guard n != 2 else {
        return 2
    }
    var result = 0
    var p1 = 1
    var p2 = 2
    for _ in 2..<n {
        result = p1 + p2
        p1 = p2
        p2 = result
    }
    return result
}

//var count = 0
//
//func climbStairs(_ n: Int) -> Int {
//    _climbStairs(n)
//    return count
//}
//
//fileprivate func _climbStairs(_ n: Int) {
//    if n == 0 {
//        count += 1
//    } else {
//        if n - 1 >= 0 {
//            _climbStairs(n - 1)
//        }
//        if n - 2 >= 0 {
//            _climbStairs(n - 2)
//        }
//    }
//}
