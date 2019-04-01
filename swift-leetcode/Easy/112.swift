//
//  112.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard root != nil else {
        return false
    }
    if root?.left == nil && root?.right == nil && root?.val == sum {
        return true
    }
    if hasPathSum(root?.left, sum - root!.val) {
        return true
    }
    if hasPathSum(root?.right, sum - root!.val) {
        return true
    }
    return false
}
