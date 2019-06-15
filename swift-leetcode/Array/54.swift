//
//  54.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题就是绕圈圈，用一个di和dj让i和j转向不同的方向
 转方向时
 1.
 (i + di) >= matrix.count ||
 (i + di) < 0 ||
 (j + dj) >= matrix[0].count ||
 (j + dj) < 0 ||
 用来判断是否数组越界
 2.
 (matrix[i + di][j + dj] == nil)
 用来判断是否达到需要旋转的地方
 
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else {
        return []
    }
    var matrix: [[Int?]] = matrix
    var res: [Int] = []
    var i = 0
    var j = 0
    var di = 0
    var dj = 1
    let count = matrix.count * matrix[0].count
    for _ in 0..<count {
        res.append(matrix[i][j]!)
        matrix[i][j] = nil
        if (i + di) >= matrix.count ||
            (i + di) < 0 ||
            (j + dj) >= matrix[0].count ||
            (j + dj) < 0 ||
            matrix[i + di][j + dj] == nil {
            let tmp = di
            di = dj
            dj = -tmp
        }
        i += di
        j += dj
    }
    return res
}
