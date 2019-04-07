//
//  24.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func swapPairs(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode.init(0)
    newHead.next = head
    var p: ListNode? = newHead
    while p?.next != nil && p?.next?.next != nil {
        let pre = p?.next
        let cur = p?.next?.next
        let last = p?.next?.next?.next
        p?.next = cur
        cur?.next = pre
        pre?.next = last
        p = p?.next?.next
    }
    return newHead.next
}
