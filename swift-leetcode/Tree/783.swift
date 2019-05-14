//
//  783.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 每个节点都比较一下其他的所有子节点，或者利用BST中序遍历是升序的知识点用中序遍历解决
 
 */

func minDiffInBST(_ root: TreeNode?) -> Int {
    func _dfs(_ res: inout Int, _ root: TreeNode?, _ num: Int) {
        guard root != nil else {
            return
        }
        res = min(res, abs(num - root!.val))
        _dfs(&res, root?.left, num)
        _dfs(&res, root?.right, num)
    }
    guard root != nil else {
        return Int.max
    }
    var res = Int.max
    _dfs(&res, root?.left, root!.val)
    _dfs(&res, root?.right, root!.val)
    return min(res, minDiffInBST(root?.left), minDiffInBST(root?.right))
}
