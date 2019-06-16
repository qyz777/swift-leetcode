//
//  73.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/16.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 用row和column的Set去存需要改变的行和列，然后赋值
 
 */

func setZeroes(_ matrix: inout [[Int]]) {
    guard !matrix.isEmpty else {
        return
    }
    var row: Set<Int> = []
    var column: Set<Int> = []
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                row.insert(i)
                column.insert(j)
            }
        }
    }
    for e in row {
        matrix[e] = Array.init(repeating: 0, count: matrix[e].count)
    }
    for e in column {
        for i in 0..<matrix.count {
            matrix[i][e] = 0
        }
    }
}
