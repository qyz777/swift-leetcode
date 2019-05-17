//
//  1008.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 Review Level: ⭐️⭐️
 
 难点:
 因为先序遍历满足BST的性质，所以根节点的下一个元素就是左子树根节点的值
 数组中第一个大于根节点值的元素就是右子树根节点的值
 
 */

func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    guard !preorder.isEmpty else {
        return nil
    }
    var preorder = preorder
    let head = TreeNode.init(preorder.removeFirst())
    var i = 0
    for n in preorder {
        //找到第一个大于根节点的值
        if n > head.val {
            break
        }
        i += 1
    }
    head.left = bstFromPreorder(Array(preorder[0..<i]))
    head.right = bstFromPreorder(Array(preorder[i..<preorder.count]))
    return head
}
