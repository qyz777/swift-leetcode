//
//  445.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var s1 = Stack<ListNode>()
    var s2 = Stack<ListNode>()
    var p1 = l1
    var p2 = l2
    let newHead = ListNode.init(0)
    let p: ListNode? = newHead
    while p1 != nil {
        s1.push(p1!)
        p1 = p1?.next
    }
    while p2 != nil {
        s2.push(p2!)
        p2 = p2?.next
    }
    var carry = 0
    while !s1.isEmpty || !s2.isEmpty {
        var sum = carry
        if !s1.isEmpty {
            sum += s1.pop()!.val
        }
        if !s2.isEmpty {
            sum += s2.pop()!.val
        }
        carry = sum > 9 ? 1 : 0
        sum = sum % 10
        let temp = ListNode.init(sum)
        temp.next = p?.next
        p?.next = temp
    }
    if carry > 0 {
        let temp = ListNode.init(1)
        temp.next = p?.next
        p?.next = temp
    }
    return newHead.next
}
