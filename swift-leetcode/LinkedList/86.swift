//
//  86.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    guard head != nil else {
        return head
    }
    let smallHead = ListNode.init(0)
    let bigHead = ListNode.init(0)
    var p = head
    var sp = smallHead
    var bp = bigHead
    while p != nil {
        if p!.val < x {
            sp.next = p
            sp = sp.next!
        } else {
            bp.next = p
            bp = bp.next!
        }
        p = p?.next
    }
    bp.next = nil
    sp.next = bigHead.next
    return smallHead.next
}
