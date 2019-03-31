//
//  104.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    let l1 = maxDepth(root?.left)
    let l2 = maxDepth(root?.right)
    return max(l1, l2) + 1
}
