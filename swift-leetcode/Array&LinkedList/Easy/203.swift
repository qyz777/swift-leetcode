//
//  203.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let tempHead = ListNode.init(0)
    tempHead.next = head
    var p: ListNode? = tempHead
    while p?.next != nil {
        if p?.next?.val == val {
            p?.next = p?.next?.next
        } else {
            p = p?.next
        }
    }
    return tempHead.next
}
