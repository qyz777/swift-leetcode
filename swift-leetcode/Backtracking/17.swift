//
//  17.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 组合问题，典型的回溯法可以解决
 
 */

func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else {
        return []
    }
    let info: [Character: [String]] = ["2": ["a", "b", "c"], "3": ["d", "e", "f"],
                                       "4": ["g", "h", "i"], "5": ["j", "k", "l"],
                                       "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"],
                                       "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]]
    func _bt(_ res: inout [String], _ path: String, _ digits: String, _ info: [Character: [String]]) {
        if digits.isEmpty {
            res.append(path)
            return
        } else {
            var digits = digits
            var path = path
            let head = digits.removeFirst()
            let letterArray = info[head]!
            for letter in letterArray {
                path += letter
                _bt(&res, path, digits, info)
                path.removeLast() //回溯
            }
        }
    }
    var res: [String] = []
    _bt(&res, "", digits, info)
    return res
}
