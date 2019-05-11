//
//  1030.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
    var res: [[Int]] = []
    res.append([r0, c0])
    for i in 0..<R {
        for j in 0..<C {
            if i != r0 || j != c0 {
                res.append([i, j])
            }
        }
    }
    res.sort { (a, b) -> Bool in
        let pre = abs(r0 - a[0]) + abs(c0 - a[1])
        let next = abs(r0 - b[0]) + abs(c0 - b[1])
        return pre < next
    }
    return res
}
