//
//  131.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func partition(_ s: String) -> [[String]] {
    var res: [[String]] = []
    func _BT(_ res: inout [[String]], _ array: [String], _ s: String) {
        if s.isEmpty {
            res.append(array)
            return
        } else {
            var nextArray = array
            var loopString = ""
            var nextString = s
            var index = 0
            for c in s {
                loopString += String(c)
                var isNeedContinue = true
                var left = 0
                var right = loopString.count - 1
                while left < right {
                    let leftStr = s[s.index(s.startIndex, offsetBy: left)..<s.index(s.startIndex, offsetBy: left + 1)]
                    let rightStr = s[s.index(s.startIndex, offsetBy: right)..<s.index(s.startIndex, offsetBy: right + 1)]
                    if leftStr != rightStr {
                        isNeedContinue = false
                        break
                    } else {
                        left += 1
                        right -= 1
                    }
                }
                nextString = String(s[s.index(s.startIndex, offsetBy: index + 1)..<s.endIndex])
                if isNeedContinue {
                    nextArray.append(loopString)
                    _BT(&res, nextArray, nextString)
                    nextArray.removeLast()
                }
                index += 1
            }
        }
    }
    _BT(&res, [], s)
    return res
}
