//
//  Odd Even Linked List.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    var pre = head
    var cur = head?.next
    while cur?.next != nil {
        let cp = cur?.next
        cur?.next = cp?.next
        let pp = pre?.next
        pre?.next = cp
        cp?.next = pp
        pre = pre?.next
        cur = cur?.next
    }
    return head
}
