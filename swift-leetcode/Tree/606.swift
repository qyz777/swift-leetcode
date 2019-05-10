//
//  606.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 需要省略不必要的括号，而且左子树不存在右子树存在时需要跟一个()
 
 80ms范例:
 这个思路太棒了，我怎么没想到呢🤦‍♂️
 
func tree2str(_ t: TreeNode?) -> String {
    if nil == t {
        return ""
    } else {
        let left = t?.left
        let right = t?.right
        if nil == left && nil == right {
            return String((t?.val)!)
        } else {
            let rightResult = tree2str(t?.right)
            return String((t?.val)!) + "(\(tree2str(left)))" + (rightResult.isEmpty ? "" : "(\(rightResult))")
        }
    }
}
 
 */

func tree2str(_ t: TreeNode?) -> String {
    guard t != nil else {
        return ""
    }
    func _DFS(_ res: inout [String], _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        res.append("(\(root!.val)")
        if root?.left == nil && root?.right != nil {
            res.append("()")
        } else {
            _DFS(&res, root?.left)
        }
        _DFS(&res, root?.right)
        res.append(")")
    }
    var res: [String] = []
    res.append("\(t!.val)")
    if t?.left == nil && t?.right != nil {
        res.append("()")
    } else {
        _DFS(&res, t?.left)
    }
    _DFS(&res, t?.right)
    return res.joined()
}
