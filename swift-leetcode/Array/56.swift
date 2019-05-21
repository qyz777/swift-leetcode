//
//  56.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 要考虑到intervals中的值不一定是连续的，所以得先排序一下再合并
 
 合并的时候通过[min(last[0], item[0]), max(last[1], item[1])]就也可以处理包含关系
 就不需要写其他逻辑了
 
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else {
        return []
    }
    //先排序
    let intervals = intervals.sorted(by: {
        return $0[0] < $1[0]
    })
    //然后合并就是了
    var res: [[Int]] = [intervals.first!]
    for item in intervals {
        if res.last![1] >= item[0] {
            let last = res.popLast()!
            res.append([min(last[0], item[0]), max(last[1], item[1])])
        } else {
            res.append(item)
        }
    }
    return res
}
