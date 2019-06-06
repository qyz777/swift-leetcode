//
//  401.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 一道神奇的题目，很简单的题目我却跪了4次，只能说题目没有说清楚
 完全没意识到不能有超过11点的时间啊？？？
 
 */

func readBinaryWatch(_ num: Int) -> [String] {
    guard num > 0 else {
        return ["0:00"]
    }
    let hour = [8, 4, 2, 1]
    let minute = [32, 16, 8, 4, 2, 1]
    func _bt(_ res: inout [String], _ count: Int, _ h: Int, _ m: Int, _ hSum: Int, _ mSum: Int, _ hour: [Int], _ minute: [Int]) {
        //服了，这题hour不能超过11，也就是没有11点以后的时间
        if hSum > 11 || mSum >= 60 {
            return
        }
        if count >= num {
            res.append(mSum > 9 ? "\(hSum):\(mSum)" : "\(hSum):0\(mSum)")
        } else {
            for i in h..<hour.count {
                _bt(&res, count + 1, i + 1, m, hSum + hour[i], mSum, hour, minute)
            }
            for j in m..<minute.count {
                _bt(&res, count + 1, hour.count, j + 1, hSum, mSum + minute[j], hour, minute)
            }
        }
    }
    var res: [String] = []
    _bt(&res, 0, 0, 0, 0, 0, hour, minute)
    return res.reversed()
}
