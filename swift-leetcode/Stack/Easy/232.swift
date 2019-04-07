//
//  232.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

class MyQueue {
    
    private var stack1: [Int] = []
    private var stack2: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack1.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        while !stack1.isEmpty {
            stack2.append(stack1.popLast()!)
        }
        let p = stack2.popLast()!
        while !stack2.isEmpty {
            stack1.append(stack2.popLast()!)
        }
        return p
    }
    
    /** Get the front element. */
    func peek() -> Int {
        while !stack1.isEmpty {
            stack2.append(stack1.popLast()!)
        }
        let p = stack2.last!
        while !stack2.isEmpty {
            stack1.append(stack2.popLast()!)
        }
        return p
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.isEmpty
    }
}
