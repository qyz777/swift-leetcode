//
//  988.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func smallestFromLeaf(_ root: TreeNode?) -> String {
    guard root != nil else {
        return ""
    }
    func _dfs(_ res: inout String, _ path: String, _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        let path = String(UnicodeScalar(root!.val + 97)!) + path
        if root?.left == nil && root?.right == nil {
            if res.isEmpty {
                res = path
            } else {
                res = min(res, path)
            }
        } else {
            _dfs(&res, path, root?.left)
            _dfs(&res, path, root?.right)
        }
    }
    var res = ""
    _dfs(&res, "", root)
    return res
}
