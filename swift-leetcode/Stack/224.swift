//
//  224.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func calculate(_ s: String) -> Int {
    func _isOperator(_ c: String) -> Bool {
        if c == "+" || c == "-" {
            return true
        }
        return false
    }
    func _isNumber(_ c: String) -> Bool {
        if Int(c) != nil {
            return true
        }
        return false
    }
    var optStack: [String] = []
    var postfixStack: [String] = []
    var chars = Array(s)
    var i = 0
    while i < chars.count {
        let c = String(chars[i])
        if _isNumber(c) {
            var str = c
            while i + 1 < chars.count && _isNumber(String(chars[i + 1])) {
                str += String(chars[i + 1])
                i += 1
            }
            postfixStack.append(str)
        } else {
            if c == "(" {
                optStack.append(c)
            } else if _isOperator(c) {
                if !optStack.isEmpty && _isOperator(optStack.last!) {
                    postfixStack.append(optStack.removeLast())
                }
                optStack.append(c)
            } else if c == ")" {
                while !optStack.isEmpty && optStack.last! != "(" {
                    postfixStack.append(optStack.removeLast())
                }
                optStack.removeLast()
            }
        }
        i += 1
    }
    while !optStack.isEmpty {
        postfixStack.append(optStack.removeLast())
    }
    var stack: [String] = []
    for str in postfixStack {
        if _isNumber(str) {
            stack.append(str)
        } else {
            let b = Int(stack.removeLast())!
            let a = Int(stack.removeLast())!
            if str == "+" {
                stack.append(String(a + b))
            } else if str == "-" {
                stack.append(String(a - b))
            }
        }
    }
    return stack.count > 1 ? Int(stack.joined())! : Int(stack.popLast()!)!
}
