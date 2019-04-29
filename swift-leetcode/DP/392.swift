//
//  392.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isSubsequence(_ s: String, _ t: String) -> Bool {
    guard s.count > 0 else {
        return true
    }
    var index = 0
    for c in t {
        if index < s.count {
            if c == s[s.index(s.startIndex, offsetBy: index)] {
                index += 1
            }
        } else {
            break
        }
    }
    return index == s.count
}
