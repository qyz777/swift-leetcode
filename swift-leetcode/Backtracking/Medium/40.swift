//
//  40.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    func _BT(_ res: inout [[Int]], _ temp: [Int], _ candidates: [Int], _ target: Int, _ start: Int, _ sum: Int) {
        if sum == target {
            let t = temp.sorted()
            if !res.contains(t) {
                res.append(t)
            }
            return
        } else if sum > target {
            return
        } else {
            var t = temp
            var s = sum
            for i in start..<candidates.count {
                t.append(candidates[i])
                s += candidates[i]
                _BT(&res, t, candidates, target, i + 1, s)
                s -= candidates[i]
                t.removeLast()
            }
        }
    }
    var res: [[Int]] = []
    _BT(&res, [], candidates, target, 0, 0)
    return res
}
