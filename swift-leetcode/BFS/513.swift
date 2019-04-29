//
//  513.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findBottomLeftValue(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    var queue: [TreeNode] = []
    queue.append(root!)
    var node: TreeNode = root!
    while queue.count != 0 {
        node = queue.removeFirst()
        if node.right != nil {
            queue.append(node.right!)
        }
        if node.left != nil {
            queue.append(node.left!)
        }
    }
    return node.val
}
