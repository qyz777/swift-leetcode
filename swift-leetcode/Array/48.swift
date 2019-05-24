//
//  48.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/24.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    var start = 0
    var end = matrix.count - 1
    while start < end {
        var p1 = start
        var p2 = end
        while p1 < end {
            let temp = matrix[start][p1]
            matrix[start][p1] = matrix[p2][start]
            matrix[p2][start] = matrix[end][p2]
            matrix[end][p2] = matrix[p1][end]
            matrix[p1][end] = temp
            p1 += 1
            p2 -= 1
        }
        start += 1
        end -= 1
    }
}
