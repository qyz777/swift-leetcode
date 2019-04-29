//
//  94.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var stack: [TreeNode] = []
    var res: [Int] = []
    var p = root
    while !stack.isEmpty || p != nil {
        while p != nil {
            stack.append(p!)
            p = p?.left
        }
        let node = stack.popLast()!
        res.append(node.val)
        if node.right != nil {
            p = node.right
        }
    }
    return res
}
