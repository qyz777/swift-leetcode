//
//  118.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    var res: [[Int]] = []
    for i in 0..<numRows {
        var array = Array.init(repeating: 1, count: i + 1)
        if i > 1 {
            for j in 1..<i {
                array[j] = res[i - 1][j - 1] + res[i - 1][j]
            }
        }
        res.append(array)
    }
    return res
}
