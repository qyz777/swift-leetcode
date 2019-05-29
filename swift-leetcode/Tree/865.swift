//
//  865.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 Review Level: ⭐️⭐️⭐️
 
 只要找到左右子树最深深度相等的节点就好了，因为要包含所有最深叶子节点
 
 */

func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {
        return root
    }
    func _maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return max(_maxDepth(root?.left), _maxDepth(root?.right)) + 1
    }
    let left = _maxDepth(root?.left)//左子树深度
    let right = _maxDepth(root?.right)//右子树深度
    if left == right {
        return root
    } else if left > right {
        return subtreeWithAllDeepest(root?.left)
    } else {
        return subtreeWithAllDeepest(root?.right)
    }
}
