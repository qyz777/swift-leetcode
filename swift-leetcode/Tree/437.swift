//
//  437.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func pathSum437(_ root: TreeNode?, _ sum: Int) -> Int {
    guard root != nil else {
        return 0
    }
    func _DFS(_ res: inout Int, _ root: TreeNode?, _ s: Int) {
        guard root != nil else {
            return
        }
        var s = s
        s += root?.val ?? 0
        if s == sum {
            res += 1
        }
        _DFS(&res, root?.left, s)
        _DFS(&res, root?.right, s)
    }
    var res = 0
    _DFS(&res, root, 0)
    return pathSum437(root?.left, sum) + pathSum437(root?.right, sum) + res
}
