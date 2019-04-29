//
//  923.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/16.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func threeSumMulti(_ A: [Int], _ target: Int) -> Int {
    let bottom: Int = Int(powf(10, 9)) + 7
    var info: [Int: Int] = [:]
    for a in A {
        if info[a] == nil {
            info[a] = 1
        } else {
            let count = info[a]!
            info[a] = count + 1
        }
    }
    var res = 0
    for (k1, v1) in info {
        for (k2, v2) in info {
            let k = target - k1 - k2
            if info[k] == nil {
                continue
            }
            if k1 == k2 && k2 == k {
                res += v1 * (v1 - 1) * (v1 - 2)
            } else if k1 == k2 && k2 != k {
                res += v1 * (v1 - 1)
            } else if k1 < k2 && k2 < k {
                res += v1 * v2 * info[k]!
            }
        }
    }
    return res % bottom
}
