//
//  49.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 用map保存结果，key为单词，value为数组
 遍历每一个单词并且给单词排序后放入map中，最后编译一遍获得结果即可
 
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var info: [String: [String]] = [:]
    for str in strs {
        let chars = Array(str).sorted()
        if info[String(chars)] == nil {
            info[String(chars)] = [str]
        } else {
            var array = info[String(chars)]!
            array.append(str)
            info[String(chars)] = array
        }
    }
    var res: [[String]] = []
    for (_, v) in info {
        res.append(v)
    }
    return res
}
