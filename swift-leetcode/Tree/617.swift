//
//  617.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    guard t1 != nil && t2 != nil else {
        if t1 != nil {
            return t1
        } else {
            return t2
        }
    }
    t1!.val += t2!.val
    if t1?.left == nil {
        t1?.left = t2?.left
    } else {
        t1?.left = mergeTrees(t1?.left, t2?.left)
    }
    if t1?.right == nil {
        t1?.right = t2?.right
    } else {
        t1?.right = mergeTrees(t1?.right, t2?.right)
    }
    return t1
}
