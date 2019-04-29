//
//  Partition Labels.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation


func partitionLabels(_ S: String) -> [Int] {
    var info: [Character: Int] = [:]
    var index = 0
    for s in S {
        info[s] = index + 1
        index += 1
    }
    index = 0
    var maxIndex = info[S.first!]!
    var array: [Int] = []
    var string = ""
    for s in S {
        let tempIndex = info[s]!
        if index < maxIndex {
            string += String(s)
        } else {
            array.append(string.count)
            string = String(s)
        }
        maxIndex = max(maxIndex, tempIndex)
        index += 1
    }
    array.append(string.count)
    return array
}
