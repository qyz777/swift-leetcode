//
//  897.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func increasingBST(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {
        return root
    }
    var stack: [TreeNode] = []
    stack.append(root!)
    var newHead: TreeNode?
    var np: TreeNode?
    var p = root
    while !stack.isEmpty {
        while p?.left != nil {
            stack.append(p!.left!)
            p = p?.left
        }
        let node = stack.popLast()!
        if newHead == nil {
            newHead = TreeNode.init(node.val)
            np = newHead
        } else {
            np?.right = TreeNode.init(node.val)
            np = np?.right
        }
        if node.right != nil {
            p = node.right
            stack.append(p!)
        }
    }
    return newHead
}
