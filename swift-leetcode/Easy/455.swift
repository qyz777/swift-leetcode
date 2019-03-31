//
//  455.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let tempG = g.sorted(by: {
        return $1 > $0
    })
    let tempS = s.sorted(by: {
        return $1 > $0
    })
    var count = 0
    var i = 0
    var j = 0
    while i < tempG.count && j < tempS.count {
        if tempG[i] <= tempS[j] {
            count += 1
            i += 1
            j += 1
        } else {
            j += 1
        }
    }
    return count
}
