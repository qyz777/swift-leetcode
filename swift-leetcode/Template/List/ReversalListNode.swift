//
//  ReversalListNode.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//var head = ListNode.init(1)
//head.next = ListNode.init(2)
//head.next?.next = ListNode.init(3)
//head.next?.next?.next = ListNode.init(4)
//head.next?.next?.next?.next = ListNode.init(5)


/// 翻转链表
/// 原地翻转链表
/// - Parameter head: 链表头
/// - Returns: 翻转后的链表
func reversal(head: ListNode) -> ListNode? {
    guard head.next != nil else {
        return head
    }
    //newHead相当于p的前一个
    //通过newHead让p指向的链表的每一个节点分别指向newHead
    //这样就完成了翻转
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
