//
//  572.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 如何判断子树
 
 当前节点且左子树右子树所有节点都满足val相等即可
 s?.val == t?.val && _isSubtree(s?.left, t?.left) && _isSubtree(s?.right, t?.right)
 */

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    func _isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil || t != nil else {
            return true
        }
        if s?.val == t?.val && _isSubtree(s?.left, t?.left) && _isSubtree(s?.right, t?.right) {
            return true
        }
        return false
    }
    guard s != nil else {
        return false
    }
    var stack: [TreeNode] = []
    stack.append(s!)
    while !stack.isEmpty {
        let node = stack.popLast()!
        if _isSubtree(node, t) {
            return true
        }
        if node.right != nil {
            stack.append(node.right!)
        }
        if node.left != nil {
            stack.append(node.left!)
        }
    }
    return false
}
