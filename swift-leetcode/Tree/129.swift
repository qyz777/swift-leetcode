//
//  129.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/
 
 Review Level: ⭐️⭐️
 
 这道题其实是一个回溯问题（dfs），不过要处理的只有左右两个子树。列出回溯的模板即可解出。
 
 */

func sumNumbers(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    func _bt(_ res: inout Int, _ path: String, _ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var path = path
        path += String(root!.val)
        if root?.left == nil && root?.right == nil {
            res += Int(path)!//到叶子节点，记录路径的值
        } else {
            _bt(&res, path, root?.left)
            _bt(&res, path, root?.right)
        }
    }
    var res = 0
    _bt(&res, "", root)
    return res
}
