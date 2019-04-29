//
//  226.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {
        return root
    }
    let tempRight = invertTree(root?.right)
    root?.right = invertTree(root?.left)
    root?.left = tempRight
    return root
}
