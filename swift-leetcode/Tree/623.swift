//
//  623.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 需要插入的第d行的上一行左右子树都必须有新的值为v的node
 
 */

func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
    guard root != nil else {
        return root
    }
    if d == 1 {
        let newRoot = TreeNode.init(v)
        newRoot.left = root
        return newRoot
    }
    var queue: [TreeNode] = []
    queue.append(root!)
    var i = 1
    while !queue.isEmpty {
        if i + 1 == d {
            while !queue.isEmpty {
                let node = queue.removeFirst()
                if node.left != nil {
                    let newNode = TreeNode.init(v)
                    newNode.left = node.left
                    node.left = newNode
                } else {
                    node.left = TreeNode.init(v)
                }
                if node.right != nil {
                    let newNode = TreeNode.init(v)
                    newNode.right = node.right
                    node.right = newNode
                } else {
                    node.right = TreeNode.init(v)
                }
            }
            return root
        }
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        i += 1
    }
    return root
}
