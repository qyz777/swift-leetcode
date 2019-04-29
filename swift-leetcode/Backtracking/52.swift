//
//  52.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func totalNQueens(_ n: Int) -> Int {
    func _DFS(_ count: inout Int, _ n: Int, _ line: Int, _ queens: [Int: Int], _ sum: [Int: Int], _ dif: [Int: Int]) {
        if line >= n {
            count += 1
            return
        }
        var q = queens
        var s = sum
        var d = dif
        for col in 0..<n {
            if q[col] != nil || s[line + col] != nil || d[line - col] != nil {
                continue
            }
            q[col] = 1
            s[line + col] = 1
            d[line - col] = 1
            _DFS(&count, n, line + 1, q, s, d)
            q.removeValue(forKey: col)
            s.removeValue(forKey: line + col)
            d.removeValue(forKey: line - col)
        }
    }
    var count: Int = 0
    _DFS(&count, n, 0, [:], [:], [:])
    return count
}
