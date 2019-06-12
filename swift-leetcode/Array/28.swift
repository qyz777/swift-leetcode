//
//  28.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation


/**
 下面是提交中另一种解决方法
 讲道理这题应该用KMP最好，但是好像没见到？
 
func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.characters.count == 0 {
        return 0
    }
    if needle.characters.count > haystack.characters.count {
        return -1
    }
    
    let haystackChars = Array(haystack.characters)
    let needleChars = Array(needle.characters)
    var i = 0
    var j = 0
    
    while i < haystackChars.count {
        if haystackChars[i] == needleChars[j] {
            j += 1
            if j == needleChars.count {
                return i - j + 1
            }
        } else {
            i -= j
            j = 0
        }
        i += 1
    }
    
    return -1
}
 
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    var res = -1
    guard !needle.isEmpty else {
        return 0
    }
    guard haystack.count >= needle.count else {
        return res
    }
    guard haystack != needle else {
        return 0
    }
    var haystackArray = Array(haystack)
    var needleArray = Array(needle)
    for i in 0..<haystackArray.count {
        if i + needleArray.count > haystackArray.count {
            break
        }
        var isOk = true
        var hchar = haystackArray[i]
        for j in 0..<needleArray.count {
            let nchar = needleArray[j]
            if hchar != nchar {
                isOk = false
                break
            }
            if i + j + 1 < haystackArray.count {
                hchar = haystackArray[i + j + 1]
            } else {
                break
            }
        }
        if isOk {
            res = i
            break
        }
    }
    return res
}
