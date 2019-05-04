//
//  501.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 需要了解的事情: BST的inOrder是升序
 
 当时写的时候没考虑到中序遍历，但是讲道理DFS怎么会那么慢呢🤦‍♂️
 
 */

func findMode(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var info: [Int: Int] = [:]
    var maxNum = 0
    func _DFS(_ root: TreeNode?, _ info: inout [Int: Int], _ maxNum: inout Int) {
        guard root != nil else {
            return
        }
        if info[root!.val] == nil {
            info[root!.val] = 1
        } else {
            info[root!.val] = info[root!.val]! + 1
        }
        maxNum = max(maxNum, info[root!.val]!)
        _DFS(root?.left, &info, &maxNum)
        _DFS(root?.right, &info, &maxNum)
    }
    _DFS(root, &info, &maxNum)
    var res: [Int] = []
    for (k, v) in info {
        if v == maxNum {
            res.append(k)
        }
    }
    return res
}
