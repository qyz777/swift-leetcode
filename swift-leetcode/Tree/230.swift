//
//  230.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard root != nil else {
        return 0
    }
    var array: [Int] = []
    var stack: [TreeNode] = []
    var cur = root
    while (!stack.isEmpty || cur != nil) && array.count < k {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        let node = stack.popLast()!
        array.append(node.val)
        if node.right != nil {
            cur = node.right
        }
    }
    return array.last!
}
