//
//  Reversal ListNode.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reversal(head: ListNode) -> ListNode? {
    guard head.next != nil else {
        return head
    }
    
    var p = head
    var newHead: ListNode?
    while p.next != nil {
        let temp = p.next
        p.next = newHead
        newHead = p
        p = temp!
    }
    p.next = newHead
    return p
}
