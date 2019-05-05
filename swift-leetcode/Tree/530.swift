//
//  530.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 考察BST中序遍历是升序的特性
 
 因为BST的中序遍历是升序，所以按照升序的情况遍历，只要通过两个两个节点值比较就能得出解
 
 */

func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    var lastNodeVal = Int.min
    var res = Int.max
    var stack: [TreeNode] = []
    var cur = root
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        let node = stack.popLast()!
        if lastNodeVal < 0 {
            lastNodeVal = node.val
        } else {
            res = min(res, abs(lastNodeVal - node.val))
            lastNodeVal = node.val
        }
        cur = node.right
    }
    return res
}
