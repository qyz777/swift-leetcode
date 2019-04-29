//
//  69.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func mySqrt(_ x: Int) -> Int {
    guard x != 1 || x != 0 else {
        return x
    }
    var left = 0
    var right = x
    var res = 0
    while left <= right {
        let mid = (right + left) / 2
        if mid * mid < x {
            left = mid + 1
            res = mid
        } else if mid * mid > x {
            right = mid - 1
        } else {
            return mid
        }
    }
    return res
}
