//
//  121.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    for i in 0..<prices.count {
        for j in 0..<i {
            if prices[i] - prices[j] > profit {
                profit = prices[i] - prices[j]
            }
        }
    }
    return profit
}
