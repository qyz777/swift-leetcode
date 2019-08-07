//
//  451.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/7.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 用Map记录下同一个字符组成的字符串，并根据字符串的排序降序排列即可
 
 */

func frequencySort(_ s: String) -> String {
    let chars = Array(s)
    var info: [Character: String] = [:]
    for c in chars {
        if info[c] == nil {
            info[c] = String(c)
        } else {
            info[c] = info[c]! + String(c)
        }
    }
    let array = info.sorted(by: {$0.value.count > $1.value.count})
    var res = ""
    for t in array {
        res += t.value
    }
    return res
}
