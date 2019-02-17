//
//  Add Two Numbers.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var tempL1 = l1
    var tempL2 = l2
    let head = ListNode.init(0)
    var curr = head
    var carry = 0
    while tempL1 != nil || tempL2 != nil {
        let x = tempL1?.val ?? 0
        let y = tempL2?.val ?? 0
        let sum = x + y + carry
        carry = sum / 10
        curr.next = ListNode.init(sum % 10)
        curr = curr.next!
        tempL1 = tempL1?.next
        tempL2 = tempL2?.next
    }
    if carry > 0 {
        curr.next = ListNode.init(carry)
    }
    return head.next
}
