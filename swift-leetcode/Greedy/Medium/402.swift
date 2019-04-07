//
//  402.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func removeKdigits(_ num: String, _ k: Int) -> String {
    guard k < num.count else {
        return "0"
    }
    var n = k
    var stack: String = ""
    for c in num {
        while !stack.isEmpty && n > 0 && c < stack.last ?? Character("") {
            n -= 1
            _ = stack.popLast()
        }
        stack.append(c)
    }
    while n > 0 {
        _ = stack.popLast()
        n -= 1
    }
    while true {
        if stack.count > 0 {
            if stack.first == "0" {
                stack.remove(at: stack.startIndex)
            } else {
                break
            }
        } else {
            break
        }
    }
    return stack == "" ? "0" : stack
}
