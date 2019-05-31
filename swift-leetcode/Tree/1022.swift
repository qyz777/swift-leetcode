//
//  1022.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 Review Level: ⭐️
 
 搜到叶子节点算数就完事了
 
 */

func sumRootToLeaf(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    func _dfs(_ res: inout Int, _ path: String, _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var path = path
        path += "\(root!.val)"
        if root!.left == nil && root!.right == nil {
            res += Int.init(path, radix: 2) ?? 0
        } else {
            _dfs(&res, path, root?.left)
            _dfs(&res, path, root?.right)
        }
    }
    var res = 0
    _dfs(&res, "", root)
    return res
}
