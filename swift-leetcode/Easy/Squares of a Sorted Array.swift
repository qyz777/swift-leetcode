//
//  Squares of a Sorted Array.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sortedSquares(_ A: [Int]) -> [Int] {
    var array: [Int] = []
    for a in A {
        array.append(a * a)
    }
    array.sort { $0 < $1 }
    return array
}
