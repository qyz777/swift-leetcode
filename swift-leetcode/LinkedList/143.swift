//
//  143.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 这题本应该不用队列的
 1. 用快慢指针找到中点
 2. 把右边的链表反转
 3. 把右边的链表插入到左边
 */

func reorderList(_ head: ListNode?) {
    var p = head?.next
    var array: [ListNode] = []
    while p != nil {
        array.append(p!)
        p = p?.next
    }
    if array.count > 1 {
        head?.next = array.popLast()!
    }
    p = head?.next
    while !array.isEmpty {
        p?.next = array.removeFirst()
        p = p?.next
        if !array.isEmpty {
            p?.next = array.removeLast()
            p = p?.next
        }
    }
    p?.next = nil
}
