//
//  14.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else {
        return ""
    }
    var maxLengthStr = ""
    let firstStr = strs.first!
    for i in 0..<firstStr.count {
        let c = firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)..<firstStr.index(firstStr.startIndex, offsetBy: i + 1)]
        var isSame = true
        for str in strs {
            if i < str.count {
                let tc = str[str.index(str.startIndex, offsetBy: i)..<str.index(str.startIndex, offsetBy: i + 1)]
                if c != tc {
                    isSame = false
                    break
                }
            } else {
                isSame = false
                break
            }
        }
        if isSame {
            maxLengthStr.append(String(c))
        } else {
            break
        }
    }
    return maxLengthStr
}
