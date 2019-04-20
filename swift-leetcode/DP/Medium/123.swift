//
//  123.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/20.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxProfit3(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
        return 0
    }
//    天 总共可以买卖几次 是否持有股票
    var dp: [[[Int]]] = Array.init(repeating: Array.init(repeating: Array.init(repeating: 0, count: 2), count: 3), count: prices.count)
    dp[0][0][0] = 0
    dp[0][0][1] = -prices[0]
    dp[0][1][0] = -Int.max / 2
    dp[0][1][1] = -Int.max / 2
    dp[0][2][0] = -Int.max / 2
    dp[0][2][1] = -Int.max / 2
    for i in 1..<prices.count {
        dp[i][0][0] = dp[i - 1][0][0]
        dp[i][0][1] = max(dp[i - 1][0][1], dp[i - 1][0][0] - prices[i])
        
        dp[i][1][0] = max(dp[i - 1][1][0], dp[i - 1][0][1] + prices[i])
        dp[i][1][1] = max(dp[i - 1][1][1], dp[i - 1][1][0] - prices[i])
        
        dp[i][2][0] = max(dp[i - 1][2][0], dp[i - 1][1][1] + prices[i])
    }
    return max(dp.last![0][0], dp.last![1][0], dp.last![2][0])
}
