//
//  111.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func minDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    if root?.right == nil {
        return 1 + minDepth(root?.left)
    }
    if root?.left == nil {
        return 1 + minDepth(root?.right)
    }
    let left = minDepth(root?.left)
    let right = minDepth(root?.right)
    return min(left, right) + 1
}
