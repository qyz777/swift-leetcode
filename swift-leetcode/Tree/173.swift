//
//  173.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 考察BST中序遍历是升序
 
 这里我在初始化了时候使用了一个array去记录中序遍历的结果
 从LeetCode跑出来的结果来看并没有每一次在next里去中序遍历来的效果好
 
 */

class BSTIterator {
    
    private var root: TreeNode?
    
    private var valArray: [Int] = []
    
    init(_ root: TreeNode?) {
        self.root = root
        var stack: [TreeNode] = []
        var cur = self.root
        // in order记录升序结果
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            let node = stack.popLast()!
            valArray.append(node.val)
            cur = node.right
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        return valArray.removeFirst()
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !valArray.isEmpty
    }
}
