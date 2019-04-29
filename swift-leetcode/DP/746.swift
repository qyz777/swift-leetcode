//
//  746.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    guard cost.count > 0 else {
        return 0
    }
    guard cost.count > 1 else {
        return min(cost[0], cost[1])
    }
    var p1 = cost[0]
    var p2 = cost[1]
    var minStairs = 0
    for i in 2..<cost.count {
        minStairs = min(p1, p2) + cost[i]
        p1 = p2
        p2 = minStairs
    }
    return min(p1, minStairs)
}
