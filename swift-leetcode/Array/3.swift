//
//  3.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 有点慢，不过思路很清晰，判断每个单词开头的最长子串长度
 
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else {
        return 0
    }
    var res = 1
    let chars = Array(s)
    for i in 0..<chars.count {
        let c = chars[i]
        var tmp: [Character: Int] = [c: 1]
        for j in i+1..<chars.count {
            let nextC = chars[j]
            if tmp[nextC] != nil {
                break
            } else {
                tmp[nextC] = 1
            }
        }
        res = max(res, tmp.count)
    }
    return res
}
