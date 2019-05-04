//
//  450.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️⭐️⭐️
 
 难点: 涉及到BST删除节点的问题
 删除节点时:
 1. 左子树为空则返回右子树
 2. 右子树为空则返回左子树
 3. 左右子树都不会空时则返回后继节点(右子树最左叶子)作为新的根
 
 _findMin用来找到右子树最左叶子节点
 _deleteMin用来删除右子树最左叶子节点
 */

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    func _findMin(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return root
        }
        var p = root
        while p?.left != nil {
            p = p?.left
        }
        return p
    }
    func _deleteMin(_ root: TreeNode?) -> TreeNode? {
        guard root?.left != nil else {
            return root?.right
        }
        root?.left = _deleteMin(root?.left)
        return root
    }
    guard root != nil else {
        return root
    }
    if root!.val > key {
        root?.left = deleteNode(root?.left, key)
    } else if root!.val < key {
        root?.right = deleteNode(root?.right, key)
    } else {
        if root?.left == nil {
            return root?.right
        } else if root?.right == nil {
            return root?.left
        } else {
            let node = _findMin(root?.right)
            node?.right = _deleteMin(root?.right)
            node?.left = root?.left
            return node
        }
    }
    return root
}
