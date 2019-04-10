//
//  21.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var p = l1
    var q = l2
    let newHead = ListNode.init(0)
    var j = newHead
    while p != nil && q != nil {
        if p!.val < q!.val {
            j.next = p
            p = p?.next
        } else {
            j.next = q
            q = q?.next
        }
        j = j.next!
    }
    if p != nil {
        j.next = p
    } else if q != nil {
        j.next = q
    }
    return newHead.next
}
