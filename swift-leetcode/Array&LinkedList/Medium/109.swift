//
//  109.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    guard head != nil else {
        return nil
    }
    guard head?.next != nil else {
        return TreeNode.init(head!.val)
    }
    var fast: ListNode? = head
    var slow: ListNode? = head
    var pre: ListNode? = slow
    while fast?.next != nil && fast?.next?.next != nil  {
        pre = slow
        fast = fast?.next?.next
        slow = slow?.next
    }
    fast = slow?.next
    pre?.next = nil
    let root = TreeNode.init(slow!.val)
    if head?.val != slow?.val {
        root.left = sortedListToBST(head)
    }
    root.right = sortedListToBST(fast)
    return root
}
