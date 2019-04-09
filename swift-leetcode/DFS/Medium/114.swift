//
//  114.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/4/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func flatten(_ root: TreeNode?) {
    guard root != nil else {
        return
    }
    var queue: [TreeNode] = []
    var stack: [TreeNode] = []
    stack.append(root!)
    while !stack.isEmpty {
        let node = stack.popLast()!
        queue.append(node)
        if node.right != nil {
            stack.append(node.right!)
        }
        if node.left != nil {
            stack.append(node.left!)
        }
    }
    root?.left = nil
    root?.right = nil
    var p = root
    for i in 1..<queue.count {
        let node = queue[i]
        node.left = nil
        node.right = nil
        p?.right = node
        p = p?.right
    }
}
