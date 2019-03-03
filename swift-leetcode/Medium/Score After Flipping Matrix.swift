//
//  Score After Flipping Matrix.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func matrixScore(_ A: [[Int]]) -> Int {
    var tempA = A
    for i in 0..<A.count {
        let array = A[i]
        let beforeScore = calculateScore(tempA)
        var shortA = tempA
        for j in 0..<array.count {
            shortA[i][j] = shortA[i][j] == 1 ? 0 : 1
        }
        let afterScore = calculateScore(shortA)
        if afterScore > beforeScore {
            tempA = shortA
        }
    }

    let maxIndex = A[0].count
    for i in 0..<maxIndex {
        let beforeScore = calculateScore(tempA)
        var shortA = tempA
        for j in 0..<A.count {
            shortA[j][i] = shortA[j][i] == 1 ? 0 : 1
        }
        let afterScore = calculateScore(shortA)
        if afterScore > beforeScore {
            tempA = shortA
        }
    }
    let score = calculateScore(tempA)
    return score
}

func calculateScore(_ A: [[Int]]) -> Int {
    var score = 0
    for array in A {
        score += matrixBinaryNum(array)
    }
    return score
}

func matrixBinaryNum(_ m: [Int]) -> Int {
    var num = 0
    let matrix = m.reversed()
    var index = 0
    for n in matrix {
        num += n == 1 ? binaryPow(2, index) : 0
        index += 1
    }
    return num
}

func binaryPow(_ x: Int, _ y: Int) -> Int {
    if y == 0 {
        return 1
    } else {
        var num = 1
        for _ in 0..<y-1 {
            num *= x
        }
        return x * num
    }
}
