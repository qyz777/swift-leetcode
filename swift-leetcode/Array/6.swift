//
//  6.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题的输入有点坑，需要判断字符串是否为空，而且有可能字符串达不到numRows要求的行数，要注意
 
 主要的思路还是用字典去记录每一行的字符串
 那么接下来的重点就放在了如何去求这个Z字形的行数，也就是字典的key
 本题我用isGrow来判断这个key是否要增加是否要减少
 target + 1 == numRows表示增加到numRows行了改减少了
 target == 0表示减少到第一行了，该增加了
 
 */

func convert(_ s: String, _ numRows: Int) -> String {
    guard !s.isEmpty else {
        return ""
    }
    let chars = Array(s)
    var res = ""
    var info: [Int: String] = [:]
    var target = 0
    var isGrow = true
    for i in 0..<chars.count {
        if info[target] == nil {
            info[target] = String(chars[i])
        } else {
            info[target] = info[target]! + String(chars[i])
        }
        target = isGrow ? target + 1 : target - 1
        if target + 1 == numRows {
            isGrow = false
        } else if target == 0 {
            isGrow = true
        }
    }
    //numRows有可能大于info的数量
    for i in 0..<info.count {
        res += info[i]!
    }
    return res
}
