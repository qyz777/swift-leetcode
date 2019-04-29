//
//  338.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/12.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func countBits(_ num: Int) -> [Int] {
    var array: [Int] = []
    for i in 0...num {
        var count = 0
        var n = i
        while n != 0 {
            count += 1
            n &= n - 1
        }
        array.append(count)
    }
    return array
}
