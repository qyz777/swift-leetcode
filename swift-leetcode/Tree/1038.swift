//
//  1038.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/20.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 考虑到BST的中序遍历是升序，那么根据题意，用反向的中序遍历即可
 
 */

func bstToGst(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {
        return root
    }
    var stack: [TreeNode] = []
    var cur = root
    var lastValue: Int = 0 //用来记录上一个的值
    //降序遍历
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.right
        }
        let node = stack.popLast()!
        node.val += lastValue
        lastValue = node.val
        cur = node.left
    }
    return root
}
