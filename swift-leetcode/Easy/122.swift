//
//  122.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxProfit2(_ prices: [Int]) -> Int {
    guard prices.count >= 1 else {
        return 0
    }
    var result = 0
    for i in 1..<prices.count {
        let temp = prices[i] - prices[i - 1]
        if temp > 0 {
            result += temp
        }
    }
    return result
}
