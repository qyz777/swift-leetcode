//
//  404.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/25.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard root?.left != nil || root?.right != nil else {
        return 0
    }
    func _search(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        guard root != nil else {
            return 0
        }
        if root?.left == nil && root?.right == nil && isLeft {
            return root!.val
        }
        return _search(root?.left, true) + _search(root?.right, false)
    }
    return _search(root, true)
}
