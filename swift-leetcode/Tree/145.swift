//
//  145.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var stack: [TreeNode] = []
    var res: [Int] = []
    var last: TreeNode?
    var cur = root
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        
        if stack.last?.right == nil || stack.last?.right?.val == last?.val {
            let node = stack.popLast()!
            res.append(node.val)
            last = node
        } else {
            cur = stack.last?.right
        }
    }
    return res
}
