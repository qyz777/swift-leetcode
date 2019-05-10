//
//  653.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 如何在O(n)的时间复杂度找到两数之和?
 
 用map，对于树来说，各种方式遍历然后用map找对应的target与当前val的差就行了
 a + b = target
 假如root.val == a，那就需要从map里找target - a的值是否存在
 
 */

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    func _dfs(_ res: inout Bool, _ info: inout [Int: Int], _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        if info[k - root!.val] != nil {
            res = true
            return
        } else {
            info[root!.val] = 1
        }
        _dfs(&res, &info, root?.left)
        _dfs(&res, &info, root?.right)
    }
    var res = false
    var info: [Int: Int] = [:]
    _dfs(&res, &info, root)
    return res
}
