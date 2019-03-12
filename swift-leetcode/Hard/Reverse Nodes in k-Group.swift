//
//  Reverse Nodes in k-Group.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/12.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let newHead = ListNode.init(0)
    newHead.next = head
    var stack: Stack<ListNode> = Stack()
    var p = newHead
    var q = head
    var count = 0
    while q != nil {
        stack.push(q!)
        q = q?.next
        count += 1
        if count % k == 0 {
            let tempNext = q?.next
            while !stack.isEmpty {
                p.next = stack.pop()
                p = p.next!
            }
            p.next = tempNext
            count = 0
        }
    }
    if count < k {
        var tempStack: Stack<ListNode> = Stack()
        while !stack.isEmpty {
            tempStack.push(stack.pop()!)
        }
        while !tempStack.isEmpty {
            p.next = tempStack.pop()
            p = p.next!
        }
    }
    return newHead.next
}
