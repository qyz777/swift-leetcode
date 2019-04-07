//
//  Reverse Linked List.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    var p = head
    let newHead = ListNode.init(0)
    while p != nil {
        let temp = p
        p = p?.next
        temp?.next = nil
        if newHead.next == nil {
            newHead.next = temp
        } else {
            let tempNext = newHead.next
            newHead.next = temp
            temp?.next = tempNext
        }
    }
    return newHead.next
}
