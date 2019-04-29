//
//  101.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    var l1: [Int] = []
    var l2: [Int] = []
    DFS(&l1, head: root, isLeft: true)
    DFS(&l2, head: root, isLeft: false)
    if l1 == l2 {
        return true
    } else {
        return false
    }
}

fileprivate func DFS(_ l: inout [Int], head: TreeNode?, isLeft: Bool) {
    if head != nil {
        l.append(head!.val)
    } else {
        l.append(Int.max)
        return
    }
    if isLeft {
        DFS(&l, head: head?.left, isLeft: isLeft)
        DFS(&l, head: head?.right, isLeft: isLeft)
    } else {
        DFS(&l, head: head?.right, isLeft: isLeft)
        DFS(&l, head: head?.left, isLeft: isLeft)
    }
}
