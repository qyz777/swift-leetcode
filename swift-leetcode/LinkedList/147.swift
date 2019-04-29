//
//  147.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/24.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func insertionSortList(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return head
    }
    let newHead = ListNode.init(0)
    newHead.next = head
    var pre: ListNode? = newHead
    var next = newHead.next
    var i = 0
    while next != nil {
        var q: ListNode? = newHead
        var p = newHead.next
        var inserted = false
        var j = 0
        while p != nil && j < i {
            if p!.val > next!.val {
                pre?.next = pre?.next?.next
                q?.next = next
                next?.next = p
                next = pre?.next
                inserted = true
                break
            }
            q = q?.next
            p = p?.next
            j += 1
        }
        if !inserted {
            pre = pre?.next
            next = next?.next
        }
        i += 1
    }
    return newHead.next
}
