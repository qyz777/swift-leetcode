//
//  863.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题莫名其妙编译出错了???
 先留着
 
 */

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
    guard root != nil && target != nil else {
        return []
    }
    func _findTarget(_ targetDepth: inout Int, _ depth: Int, _ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        if root?.val == target?.val {
            targetDepth = depth
            return root
        }
        if let leftNode = _findTarget(&targetDepth, depth + 1, root?.left) {
            return leftNode
        } else if let rightNode = _findTarget(&targetDepth, depth + 1, root?.right) {
            return rightNode
        } else {
            return nil
        }
    }
    func _findNode(_ res: inout [Int], _ root: TreeNode?, _ targetDepth: Int, _ depth: Int) {
        guard root != nil else {
            return
        }
        if depth == targetDepth && root?.val != target?.val {
            res.append(root!.val)
            return
        }
        _findNode(&res, root?.left, targetDepth, depth + 1)
        _findNode(&res, root?.right, targetDepth, depth + 1)
    }
    var res: [Int] = []
    if root?.val == target?.val {
        _findNode(&res, root, K, 0)
    } else {
        var targetDepth = 0
        if let node = _findTarget(&targetDepth, 0, root) {
            _findNode(&res, node, K, 0)
            if targetDepth < K {
                _findNode(&res, root, K - targetDepth, 0)
            }
        }
    }
    return res
}
