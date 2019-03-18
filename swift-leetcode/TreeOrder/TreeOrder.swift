//
//  TreeOrder.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//let tree = TreeNode.init(0)
//tree.left = TreeNode.init(1)
//tree.right = TreeNode.init(2)
//tree.left?.left = TreeNode.init(3)
//tree.left?.right = TreeNode.init(4)
//tree.right?.left = TreeNode.init(5)
//tree.right?.right = TreeNode.init(6)

// 层序遍历
func levelOrder(_ head: TreeNode?) {
    guard head != nil else {
        return
    }
    var queue: [TreeNode] = []
    queue.append(head!)
    while queue.count != 0 {
        let front = queue[0]
        queue.remove(at: 0)
        if front.left != nil {
            queue.append(front.left!)
        }
        if front.right != nil {
            queue.append(front.right!)
        }
        print(front.val)
    }
}

func preOrder(_ head: TreeNode?) {
    guard head != nil else {
        return
    }
    print(head!.val)
    preOrder(head?.left)
    preOrder(head?.right)
}

func preOrderNoRecursive(_ head: TreeNode?) {
    guard head != nil else {
        return
    }
    var stack: Stack<TreeNode> = Stack()
    stack.push(head!)
    while !stack.isEmpty {
        let node = stack.pop()
        print(node!.val)
        if node?.right != nil {
            stack.push(node!.right!)
        }
        if node?.left != nil {
            stack.push(node!.left!)
        }
    }
}
