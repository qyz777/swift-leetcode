//
//  19.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard n > 0 else {
        return head
    }
    var p = head
    var q = p
    var index = n
    while index > 0 {
        q = q?.next
        index -= 1
    }
    if q == nil {
        return p?.next
    }
    while q?.next != nil {
        p = p?.next
        q = q?.next
    }
    let cur = p?.next?.next
    p?.next = cur
    return head
}
