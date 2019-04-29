//
//  20.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isValid(_ s: String) -> Bool {
    var stack: Stack<Character> = Stack()
    for c in s {
        if stack.isEmpty {
            stack.push(c)
        } else {
            if stack.top == "{" {
                if c == "}" {
                    _ = stack.pop()
                } else {
                    stack.push(c)
                }
            } else if stack.top == "(" {
                if c == ")" {
                    _ = stack.pop()
                } else {
                    stack.push(c)
                }
            } else if stack.top == "[" {
                if c == "]" {
                    _ = stack.pop()
                } else {
                    stack.push(c)
                }
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}
