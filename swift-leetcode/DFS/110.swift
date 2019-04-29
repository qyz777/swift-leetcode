//
//  110.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return true
    }
    let leftDepth = _treeDepth(root?.left)
    let rightDepth = _treeDepth(root?.right)
    if abs(leftDepth - rightDepth) > 1 {
        return false
    }
    let left = isBalanced(root?.left)
    let right = isBalanced(root?.right)
    return left && right
}

fileprivate func _treeDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    let left = _treeDepth(root?.left)
    let right = _treeDepth(root?.right)
    return max(left, right) + 1
}
