//
//  187.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 很基本的双指针+Hash表的应用
 双指针保持10的间距一个一个截取s的sub string放在map里即可判断是否存在重复子序列
 
 */

func findRepeatedDnaSequences(_ s: String) -> [String] {
    guard s.count > 9 else {
        return []
    }
    //注意一定要转成Array再截取，直接用String截取会超时!!!
    let s = Array(s)
    var info: [String: Int] = [:]
    var res: [String] = []
    for i in 0..<s.count - 9 {
        let subString = String(s[i...i+9])
        if info[subString] == nil {
            info[subString] = 0
        } else {
            if info[subString] == 0 {
                //res存过一次就改变value，下次判断就不是0也就不会重复存了
                info[subString] = 1
                res.append(subString)
            }
        }
    }
    return res
}
