//
//  Binary Tree Pruning.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func pruneTree(_ root: TreeNode?) -> TreeNode? {
    var tempRoot = root
    posOrder(with: &tempRoot)
    return tempRoot
}

func posOrder(with node: inout TreeNode?) {
    guard node != nil else {
        return
    }
    posOrder(with: &node!.left)
    posOrder(with: &node!.right)
    if node?.val == 0 && node?.left == nil && node?.right == nil {
        node = nil
    }
}
