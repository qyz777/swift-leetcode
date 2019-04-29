//
//  83.swift
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
    var p = head
    while p?.next != nil {
        if p?.val == p?.next?.val {
            p?.next = p?.next?.next
        } else {
            p = p?.next
        }
    }
    return head
}
