//
//  Middle of the Linked List.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    var p: ListNode?
    if fast?.next == nil {
        p = slow
    } else if fast?.next?.next == nil {
        p = slow?.next
    }
    return p
}
