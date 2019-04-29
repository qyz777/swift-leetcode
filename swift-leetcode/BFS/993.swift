//
//  993.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    guard root != nil else {
        return false
    }
    var queue: [TreeNode] = []
    queue.append(root!)
    while !queue.isEmpty {
        var info: [Int: Int] = [:]
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            if (node.left?.val == x && node.right?.val == y) ||
                (node.right?.val == x && node.left?.val == y) {
                return false
            }
            info[node.val] = 1
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        if info[x] != nil && info[y] != nil {
            return true
        }
    }
    return false
}
