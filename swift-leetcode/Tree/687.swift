//
//  687.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/12.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 找出最长相同值的路径
 
 可以参考543 这两题很相似
 
 */

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    func _maxLength(_ res: inout Int,_ root: TreeNode?, _ val: Int) -> Int {
        guard root != nil else {
            return 0
        }
        let left = _maxLength(&res, root?.left, root!.val)
        let right = _maxLength(&res, root?.right, root!.val)
        // 这个时候左和右路径需要连起来判断有没有之前的长
        res = max(res, left + right)
        if root!.val == val {
            // 这个时候是选一条最长的返回
            return max(left, right) + 1
        }
        return 0
    }
    guard root != nil else {
        return 0
    }
    var res = 0
    _ = _maxLength(&res, root, root!.val)
    return res
}
