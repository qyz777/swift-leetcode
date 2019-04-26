//
//  1026.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    func _DFS(_ node: TreeNode?, _ maxValue: inout Int, _ rootValue: Int) {
        guard node != nil else {
            return
        }
        maxValue = max(maxValue, abs(rootValue - node!.val))
        _DFS(node?.left, &maxValue, rootValue)
        _DFS(node?.right, &maxValue, rootValue)
    }
    var res = 0
    var stack: [TreeNode] = []
    stack.append(root!)
    while !stack.isEmpty {
        let node = stack.popLast()!
        _DFS(node, &res, node.val)
        if node.right != nil {
            stack.append(node.right!)
        }
        if node.left != nil {
            stack.append(node.left!)
        }
    }
    return res
}
