//
//  100.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    var l1: [Int] = []
    var l2: [Int] = []
    preOrder(&l1, head: p)
    preOrder(&l2, head: q)
    guard l1.count == l2.count else {
        return false
    }
    if l1 == l2 {
        return true
    } else {
        return false
    }
}

fileprivate func preOrder(_ list: inout [Int], head: TreeNode?) {
    if head != nil {
        list.append(head!.val)
    } else {
        list.append(Int.min)
        return
    }
    preOrder(&list, head: head?.left)
    preOrder(&list, head: head?.right)
}
