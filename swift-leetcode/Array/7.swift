//
//  7.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverse(_ x: Int) -> Int {
    var str = String(x)
    var symbol = ""
    if str.hasPrefix("-") {
        symbol = String(str.removeFirst())
    }
    var newStr = ""
    var i = 0
    while str.count > 0 {
        let c = str.popLast()!
        newStr.insert(c, at: newStr.index(newStr.startIndex, offsetBy: i))
        i += 1
    }
    var res = Int(symbol + newStr)!
    if res > 2147483647 || res < -2147483647 {
        res = 0
    }
    return res
}
