//
//  9.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }
    let str = String(x)
    var left = 0
    var right = str.count - 1
    while left < right {
        let leftStr = str[str.index(str.startIndex, offsetBy: left)..<str.index(str.startIndex, offsetBy: left + 1)]
        let rightStr = str[str.index(str.startIndex, offsetBy: right)..<str.index(str.startIndex, offsetBy: right + 1)]
        if leftStr != rightStr {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
