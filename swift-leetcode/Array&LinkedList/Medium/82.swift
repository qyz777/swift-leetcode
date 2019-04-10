//
//  82.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return head
    }
    var info: [Int: Int] = [:]
    var p = head
    while p != nil {
        if info[p!.val] == nil {
            info[p!.val] = 1
        } else {
            let count = info[p!.val]!
            info[p!.val] = count + 1
        }
        p = p?.next
    }
    let tempHead = ListNode.init(0)
    tempHead.next = head
    p = tempHead
    while p?.next != nil {
        let count = info[p!.next!.val]!
        if count > 1 {
            p?.next = p?.next?.next
        } else {
            p = p?.next
        }
    }
    return tempHead.next
}
