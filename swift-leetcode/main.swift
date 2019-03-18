//
//  main.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation


//let l = ListNode.init(1)
//l.next = ListNode.init(2)
//l.next?.next = ListNode.init(2)
//l.next?.next?.next = ListNode.init(2)
//l.next?.next?.next?.next = ListNode.init(2)
//l.next?.next?.next?.next?.next = ListNode.init(1)
//
//_ = isPalindrome(l)


let tree = TreeNode.init(0)
tree.left = TreeNode.init(1)
tree.right = TreeNode.init(2)
tree.left?.left = TreeNode.init(3)
tree.left?.right = TreeNode.init(4)
tree.right?.left = TreeNode.init(5)
tree.right?.right = TreeNode.init(6)

postOrderNoRecursive(tree)
