//
//  718.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/*
 dp表
  3 2 1 4 7
1 0 0 1 0 0
2 0 1 0 0 0
3 1 0 0 0 0
2 0 2 0 0 0
1 0 0 3 0 0
 
 */

func findLength(_ A: [Int], _ B: [Int]) -> Int {
    var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: B.count + 1), count: A.count + 1)
    var res = 0
    for i in 1...A.count {
        for j in 1...B.count {
            if A[i - 1] == B[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
                res = max(res, dp[i][j])
            }
        }
    }
    return res
}
