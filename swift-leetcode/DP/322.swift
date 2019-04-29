//
//  322.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp: [Int] = [0]
    for _ in 0..<amount {
        dp.append(Int.max / 2)
    }
    for i in 0...amount {
        for j in 0..<coins.count {
            if i - coins[j] >= 0 {
                if dp[i] > dp[i - coins[j]] + 1 {
                    dp[i] = dp[i - coins[j]] + 1
                }
            }
        }
    }
    return dp[amount] == Int.max / 2 ? -1 : dp[amount]
}
