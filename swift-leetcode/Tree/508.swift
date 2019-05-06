//
//  508.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
    func _DFS(_ sum: inout Int, _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        sum += root!.val
        _DFS(&sum, root?.left)
        _DFS(&sum, root?.right)
    }
    guard root != nil else {
        return []
    }
    var info: [Int: Int] = [:]
    var maxCount = Int.min
    var stack: [TreeNode] = []
    stack.append(root!)
    while !stack.isEmpty {
        let node = stack.popLast()!
        var sum = 0
        _DFS(&sum, node)
        if info[sum] == nil {
            info[sum] = 1
        } else {
            info[sum] = info[sum]! + 1
        }
        maxCount = max(maxCount, info[sum]!)
        if node.right != nil {
            stack.append(node.right!)
        }
        if node.left != nil {
            stack.append(node.left!)
        }
    }
    var res: [Int] = []
    for (k, v) in info {
        if v == maxCount {
            res.append(k)
        }
    }
    return res
}
