//
//  538.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 利用BST的性质是中序遍历是递增序列，那么只要反向的中序遍历即可拿到递减序列，累加即可
 
 */

func convertBST(_ root: TreeNode?) -> TreeNode? {
    var stack: [TreeNode] = []
    var cur = root
    var lastNode: TreeNode? = nil
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.right
        }
        let node = stack.popLast()!
        node.val += lastNode?.val ?? 0
        lastNode = node
        cur = node.left
    }
    return root
}
