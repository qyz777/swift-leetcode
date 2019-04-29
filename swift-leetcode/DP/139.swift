//
//  139.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dp: [Bool] = []
    for _ in 0...s.count {
        dp.append(false)
    }
    dp[0] = true
    for i in 1...s.count {
        for word in wordDict {
            if i >= word.count && dp[i - word.count] {
                let str = s[s.index(s.startIndex, offsetBy: i - word.count)..<s.index(s.startIndex, offsetBy: i)]
                if word == str {
                    dp[i] = true
                }
            }
        }
    }
    return dp.last!
}
