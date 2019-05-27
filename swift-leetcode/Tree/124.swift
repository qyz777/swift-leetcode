//
//  124.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/
 
 类似687
 
 引用评论区的话:
 对于任意一个节点, 如果最大和路径包含该节点, 那么只可能是两种情况:
 1. 其左右子树中所构成的和路径值较大的那个加上该节点的值后向父节点回溯构成最大路径
 2. 左右子树都在最大路径中, 加上该节点的值构成了最终的最大路径
 
 */

func maxPathSum(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    func _search(_ root: TreeNode?, _ res: inout Int) -> Int {
        guard root != nil else {
            return 0
        }
        let left = max(0, _search(root?.left, &res))//left为0就说明左子树不包含最大路径
        let right = max(0, _search(root?.right, &res))//right为0也一样
        res = max(res, root!.val + left + right)//这样写包含了 1 和 2两种情况
        return max(left, right) + root!.val
    }
    var res = Int.min
    _ = _search(root, &res)
    return res
}
