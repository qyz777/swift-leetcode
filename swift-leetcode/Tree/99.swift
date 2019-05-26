//
//  99.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level:⭐️⭐️⭐️
 
 难点:
 考察BST性质，可以用中序遍历中 前一个元素 < 当前元素 < 后一个元素 的条件
 这样可以在常数级别的空间复杂度解决问题
 
 这里我用的是傻办法，就是收集前面的所有节点，只要不满足BST的条件就交换val
 
 */

func recoverTree(_ root: TreeNode?) {
    guard root != nil else {
        return
    }
    var cur = root
    var stack: [TreeNode] = []
    var nodeArray: [TreeNode] = []
//    先怼上中序遍历模板，然后改一改就好使了
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }
        let node = stack.popLast()!
        for n in nodeArray {
            if node.val < n.val {
                let temp = n.val
                n.val = node.val
                node.val = temp
            }
        }
        nodeArray.append(node)
        cur = node.right
    }
}
