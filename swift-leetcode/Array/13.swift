//
//  13.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 思路很清晰，小的放在大的左边表示的整数为 大 - 小
 小的放在大的右边表表示的整数为 大 + 小
 
 所以遍历字符串，每次去取字符串前一位a和后一位b，令整数结果为res
 if b <= a则 res += a的整数
 else 则res += (b的整数 - a的整数)
 
 */

func romanToInt(_ s: String) -> Int {
    var info: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let chars = Array(s)
    var res = 0
    var i = 0
    while i < chars.count {
        let c = chars[i]
        if i + 1 < chars.count {
            let nextC = chars[i + 1]
            if info[nextC]! <= info[c]! {
                res += info[c]!
                i += 1
            } else {
                i = i + 2
                res += info[nextC]! - info[c]!
            }
        } else {
            res += info[c]!
            i += 1
        }
    }
    return res
}
