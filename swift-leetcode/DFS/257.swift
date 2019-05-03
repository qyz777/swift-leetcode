//
//  257.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard root != nil else {
        return []
    }
    func _DFS(_ res: inout [String], _ root: TreeNode?, _ path: String) {
        var path = path
        if root?.left == nil && root?.right == nil {
            path += "\(root!.val)"
            res.append(path)
        } else {
            path += "\(root!.val)->"
        }
        if root?.left != nil {
            _DFS(&res, root?.left, path)
        }
        if root?.right != nil {
            _DFS(&res, root?.right, path)
        }
    }
    var res: [String] = []
    _DFS(&res, root, "")
    return res
}
