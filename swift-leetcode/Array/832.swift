//
//  Flipping an Image.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var matrix: [[Int]] = []
    for a in A {
        var tempA = a
        for i in 0..<tempA.count {
            tempA[i] = tempA[i] == 1 ? 0 : 1
        }
        matrix.append(tempA.reversed())
    }
    return matrix
}
