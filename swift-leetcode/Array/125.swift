//
//  125.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
    func _isLetterOrNumber(_ char: Character) -> Bool {
        let value = Int(char.unicodeScalars.first!.value)
        if (value >= 48 && value <= 57) ||
            (value >= 65 && value <= 90) ||
            (value >= 97 && value <= 122) {
            return true
        }
        return false
    }
    let chars = Array(s.lowercased())
    var left = 0
    var right = s.count - 1
    while left < right {
        while left < right && !_isLetterOrNumber(chars[left]) {
            left += 1
        }
        while left < right && !_isLetterOrNumber(chars[right]) {
            right -= 1
        }
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
