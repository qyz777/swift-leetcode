//
//  61.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else {
        return head
    }
    var queue: [ListNode] = []
    var p = head
    while p != nil {
        queue.append(p!)
        p = p?.next
    }
    if queue.count == 1 {
        return head
    }
    let repeatCount = k % queue.count
    for _ in 0..<repeatCount {
        let node = queue.popLast()!
        node.next = queue.first!
        queue.insert(node, at: 0)
        queue.last!.next = nil
    }
    return queue.first!
}
