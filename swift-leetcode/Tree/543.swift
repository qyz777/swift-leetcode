//
//  543.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 最长的路径不一定会过根节点，需要挨个节点比较
 
 思路就是每个节点拿到它的最大深度，去比较他们之间的距离取最大值
 
 */

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    func _maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return max(_maxDepth(root?.left), _maxDepth(root?.right)) + 1
    }
    func _diameterOfBinaryTree(_ res: inout Int, _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        res = max(res, _maxDepth(root?.left) + _maxDepth(root?.right) + 1)
        _diameterOfBinaryTree(&res, root?.left)
        _diameterOfBinaryTree(&res, root?.right)
    }
    guard root != nil else {
        return 0
    }
    var res = 0
    _diameterOfBinaryTree(&res, root)
    return res - 1
}
