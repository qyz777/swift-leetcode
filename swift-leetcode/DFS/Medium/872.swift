//
//  872.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    func _DFS(_ nodes: inout [Int], _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        if root?.left == nil && root?.right == nil {
            nodes.append(root!.val)
        } else {
            _DFS(&nodes, root?.left)
            _DFS(&nodes, root?.right)
        }
    }
    var nodes1: [Int] = []
    var nodes2: [Int] = []
    _DFS(&nodes1, root1)
    _DFS(&nodes2, root2)
    nodes1.sort()
    nodes2.sort()
    if nodes1.count != nodes2.count {
        return false
    }
    for i in 0..<nodes1.count {
        if nodes1[i] != nodes2[i] {
            return false
        }
    }
    return true
}
