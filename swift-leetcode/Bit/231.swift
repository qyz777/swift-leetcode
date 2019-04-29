//
//  231.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/12.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isPowerOfTwo(_ n: Int) -> Bool {
    var mask = 1
    for _ in 0...32 {
        if mask == n {
            return true
        }
        mask <<= 1
    }
    return false
}
