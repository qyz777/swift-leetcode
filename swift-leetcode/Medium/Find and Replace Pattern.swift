//
//  Find and Replace Pattern.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    var dataArray: [String] = []
    for word in words {
        var info: [String: String] = [:]
        var count = 0
        for i in 0..<word.count {
            let key = String(pattern[pattern.index(pattern.startIndex, offsetBy: i)])
            let value = String(word[word.index(word.startIndex, offsetBy: i)])
            if info[key] == nil {
                info[key] = value
                count += 1
            } else {
                if value != info[key] {
                    break
                } else {
                    info[key] = value
                    count += 1
                }
            }
        }
        var tempInfo: [String: String] = [:]
        for (k, v) in info {
            tempInfo[v] = k
        }
        if count == word.count && tempInfo.count == info.count {
            dataArray.append(word)
        }
    }
    return dataArray
}
