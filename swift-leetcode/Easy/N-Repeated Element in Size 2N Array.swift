//
//  N-Repeated Element in Size 2N Array.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func repeatedNTimes(_ A: [Int]) -> Int {
    let size = A.count
    let repeatCount: Int = size / 2
    let copyA = A
    for a in A {
        var count = 0
        for ca in copyA {
            if a == ca {
                count += 1
            }
            if count == repeatCount {
                return a
            }
        }
    }
    return A.first!
}
