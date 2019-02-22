//
//  Insert into a Binary Search Tree.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var node = root
    while node != nil {
        if val < node?.val ?? 0 {
            if node?.left == nil {
                node?.left = TreeNode.init(val)
                break
            } else {
                node = node?.left
            }
        } else {
            if node?.right == nil {
                node?.right = TreeNode.init(val)
                break
            } else {
                node = node?.right
            }
        }
    }
    return root
}
