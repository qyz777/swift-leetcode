//
//  5.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 dp(i, j) = (dp(i+1, j−1) && S[i] == S[j])
 i...j的串是否是回文串只要检测它的i+1...j-1的子串是否是回文串且i字符和j字符相等
 
 */

func dp_longestPalindrome(_ s: String) -> String {
    guard s.count > 0 else {
        return ""
    }
    var array = Array(s)
    var res: [Character] = []
    var dp = Array.init(repeating: Array.init(repeating: false, count: array.count), count: array.count)
    for len in 1...array.count {
        // len是回文串长度
        for start in 0..<array.count {
            // start是回文串左侧
            let end = len - 1 + start // end是回文串右侧
            if end >= array.count {
                break
            }
            // 长度是1和长度是2的单独处理一下
            dp[start][end] = ((len == 1 || len == 2 || dp[start + 1][end - 1]) && array[start] == array[end])
            if dp[start][end] && len > res.count {
                res = Array(array[start...end])
            }
        }
    }
    return String(res)
}

//  超时
//func dp_longestPalindrome(_ s: String) -> String {
//    guard s.count > 0 else {
//        return ""
//    }
//    func _isHuiWen(_ array: [Character]) -> Bool {
//        var i = 0
//        var j = array.count - 1
//        while i < j {
//            if array[i] != array[j] {
//                return false
//            }
//            i += 1
//            j -= 1
//        }
//        return true
//    }
//    let array = Array(s)
//    var res = [array.first!]
//    for i in 1..<array.count {
//        var huiWen: [Character] = []
//        for j in 0..<i {
//            if _isHuiWen(Array(array[j...i])) {
//                huiWen = Array(array[j...i])
//                break
//            }
//        }
//        if huiWen.count > res.count {
//            res = huiWen
//        }
//    }
//    return String(res)
//}
