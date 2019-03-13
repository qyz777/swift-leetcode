//
//  92.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    guard n > m else {
        return head
    }
    var index = 1
    let newHead = ListNode.init(0)
    newHead.next = head
    var p = head
    var seg: ListNode = newHead
    var stack: Stack<ListNode?> = Stack()
    while index <= n {
        if index < m {
            seg = p!
        } else {
            stack.push(p)
        }
        p = p?.next
        index += 1
    }
    while !stack.isEmpty {
        seg.next = stack.pop()!
        seg = seg.next!
    }
    seg.next = p
    return newHead.next
}
