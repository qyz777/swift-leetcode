//
//  66.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    guard !digits.isEmpty else {
        return [1]
    }
    var digits = digits
    var i = digits.count - 1
    digits[i] = digits[i] + 1
    var carry = 0
    while i >= 0 {
        let val = digits[i] + carry
        digits[i] = val % 10
        carry = val > 9 ? 1 : 0
        if carry == 0 {
            break
        }
        i -= 1
    }
    if carry == 1 {
        digits.insert(1, at: 0)
    }
    return digits
}
