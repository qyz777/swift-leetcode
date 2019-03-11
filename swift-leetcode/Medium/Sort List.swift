//
//  Sort List.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sortList(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
        return head
    }
    var fastNode = head
    var slowNode = head
    while fastNode?.next != nil && fastNode?.next?.next != nil {
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
    }
    fastNode = slowNode
    slowNode = fastNode?.next
    fastNode?.next = nil
    let l1 = sortList(head)
    let l2 = sortList(slowNode)
    return mergeTwoList(l1, l2)
}

func mergeTwoList(_ one: ListNode?, _ two: ListNode?) -> ListNode? {
    let newHead = ListNode.init(0)
    var p = newHead
    var oneP = one
    var twoP = two
    while oneP != nil && twoP != nil {
        if oneP!.val < twoP!.val {
            let temp = oneP
            p.next = temp
            oneP = oneP?.next
        } else {
            let temp = twoP
            p.next = temp
            twoP = twoP?.next
        }
        p = p.next!
    }
    if oneP != nil {
        p.next = oneP
    }
    if twoP != nil {
        p.next = twoP
    }
    return newHead.next
}
