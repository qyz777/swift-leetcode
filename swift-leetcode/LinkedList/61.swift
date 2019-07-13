//
//  61.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 注意每个node向右移动K个是有可能超过链表长度的，
 所以为了降低时间复杂度，只需要计算出实际右移的数量即 k % len(listNode)
 
 */

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else {
        return head
    }
    var queue: [ListNode] = []
    var p = head
    //把链表每个node保存在数组里
    while p != nil {
        queue.append(p!)
        p = p?.next
    }
    if queue.count == 1 {
        return head
    }
    //获取实际右移长度
    let repeatCount = k % queue.count
    for _ in 0..<repeatCount {
        //将尾node的next指向头
        //然后插入到数组第一位
        //再让此时数组最后一个node的next指向nil
        let node = queue.popLast()!
        node.next = queue.first!
        queue.insert(node, at: 0)
        queue.last!.next = nil
    }
    //数组头node既是答案
    return queue.first!
}
