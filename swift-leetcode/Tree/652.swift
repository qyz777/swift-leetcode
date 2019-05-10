//
//  652.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 序列化的树
 
 很简单能想到序列化树然后在用map去记录
 但是把序列化的树作为key的时候千万要记住空的子树需要用占位符，不然会导致后续的key相等就出错，这里用的是"@"
 
 */

func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    guard root != nil else {
        return []
    }
    func _preOrder(_ root: TreeNode?) -> String {
        guard root != nil else {
            return "@"
        }
        let cur = "\(root!.val)"
        let left = _preOrder(root?.left)
        let right = _preOrder(root?.right)
        return cur + left + right
    }
    func _dfs(_ res: inout [TreeNode?], _ info: inout [String: Int], _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        let path = _preOrder(root)
        if info[path] == nil {
            info[path] = 1
        } else {
            if info[path] != 0 {
                info[path] = 0
                res.append(root)
            }
        }
        _dfs(&res, &info, root?.left)
        _dfs(&res, &info, root?.right)
    }
    var info: [String: Int] = [:]
    var res: [TreeNode?] = []
    _dfs(&res, &info, root)
    return res
}
