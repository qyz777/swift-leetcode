//
//  119.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex > 0 else {
        return [1]
    }
    guard rowIndex > 1 else {
        return [1, 1]
    }
    var row = [1, 1]
    var res: [Int] = []
    for i in 2...rowIndex {
        res = Array.init(repeating: 1, count: i + 1)
        for j in 1..<i {
            res[j] = row[j - 1] + row[j]
        }
        row = res
    }
    return res
}
