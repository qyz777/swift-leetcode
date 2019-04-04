//
//  225.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

class MyStack {
    
    private var queue1: [Int] = []
    private var queue2: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue1.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        while queue1.count > 1 {
            queue2.append(queue1.remove(at: 0))
        }
        let p = queue1.remove(at: 0)
        while queue2.count > 0 {
            queue1.append(queue2.remove(at: 0))
        }
        return p
    }
    
    /** Get the top element. */
    func top() -> Int {
        while queue1.count > 1 {
            queue2.append(queue1.remove(at: 0))
        }
        let p = queue1.remove(at: 0)
        while queue2.count > 0 {
            queue1.append(queue2.remove(at: 0))
        }
        queue1.append(p)
        return p
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.isEmpty
    }
}
