//
//  72.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//ref: https://time.geekbang.org/course/detail/130-69785

func minDistance(_ word1: String, _ word2: String) -> Int {
//    状态定义 dp[i][j] word1前i个字符转化为word2前j个字符的最少次数
    var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: word2.count + 1), count: word1.count + 1)
//    word2长度为0的话需要全删除，所以是i次
    for i in 0...word1.count {
        dp[i][0] = i
    }
//    word1长度为0的话需要全添加，所以是j次
    for j in 0...word2.count {
        dp[0][j] = j
    }
    guard word1.count > 0 && word2.count > 0 else {
        return dp.last!.last!
    }
    for i in 1...word1.count {
        for j in 1...word2.count {
            let w1 = word1[word1.index(word1.startIndex, offsetBy: i - 1)..<word1.index(word1.startIndex, offsetBy: i)]
            let w2 = word2[word2.index(word2.startIndex, offsetBy: j - 1)..<word2.index(word2.startIndex, offsetBy: j)]
            if w1 == w2 {
//                什么也不用干
                dp[i][j] = dp[i - 1][j - 1]
            } else {
//                min(插入, 删除, 替换)
                dp[i][j] = min(dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1] + 1)
            }
        }
    }
    return dp.last!.last!
}
