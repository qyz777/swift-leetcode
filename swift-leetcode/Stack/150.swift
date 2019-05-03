//
//  150.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

// 这个可以理解为通过后缀表达式求值

func evalRPN(_ tokens: [String]) -> Int {
    var stack: [String] = []
    tokens.forEach { (s) in
        if Int(String(s)) != nil {
            stack.append(String(s))
        } else {
            let b = Int(stack.popLast()!)!
            let a = Int(stack.popLast()!)!
            switch s {
            case "+": stack.append(String(a + b))
            case "-": stack.append(String(a - b))
            case "*": stack.append(String(a * b))
            case "/": stack.append(String(a / b))
            default:
                break
            }
        }
    }
    return Int(stack.last!)!
}
