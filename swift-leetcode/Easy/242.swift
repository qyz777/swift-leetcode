//
//  242.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    var m: [Character: Int] = [:]
    for c in s {
        if m[c] == nil {
            m[c] = 1
        } else {
            let count = m[c]!
            m[c] = count + 1
        }
    }
    for c in t {
        if m[c] == nil {
            return false
        } else {
            let count = m[c]!
            m[c] = count - 1
        }
        if m[c]! == 0 {
            m.removeValue(forKey: c)
        }
    }
    return m.isEmpty
}
