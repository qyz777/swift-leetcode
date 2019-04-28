//
//  144.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var stack: [TreeNode] = []
    var res: [Int] = []
    stack.append(root!)
    while !stack.isEmpty {
        let node = stack.popLast()!
        res.append(node.val)
        if node.right != nil {
            stack.append(node.right!)
        }
        if node.left != nil {
            stack.append(node.left!)
        }
    }
    return res
}
