//
//  23.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 1. 合并有序链表
 2. 同时合并多个有序链表会超时
 
 我第一次的写法是用for循环去遍历每一个lists的头结点然后合并链表，这样会超时。
 所以需要用上分治的思想，把问题简化成合并两个有序链表
 
 用上了21题实现的方法 mergeTwoLists
 */

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else {
        return nil
    }
    guard lists.count > 1 else {
        return lists.first!
    }
    guard lists.count > 2 else {
        return mergeTwoLists(lists[0], lists[1])
    }
    let mid = lists.count / 2
    var leftArray: [ListNode?] = []
    var rightArray: [ListNode?] = []
    for i in 0..<mid {
        leftArray.append(lists[i])
    }
    for i in mid..<lists.count {
        rightArray.append(lists[i])
    }
    return mergeTwoLists(mergeKLists(leftArray), mergeKLists(rightArray))
}

// 超时了
//func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//    var lists = lists
//    let head: ListNode? = ListNode.init(0)
//    var p = head
//    while !lists.isEmpty {
//        var i = 0
//        var minI = 0
//        var minValue = Int.max
//        for list in lists {
//            guard list != nil else {
//                lists.remove(at: i)
//                continue
//            }
//            if list!.val < minValue {
//                minValue = list!.val
//                minI = i
//            }
//            i += 1
//        }
//        guard !lists.isEmpty else {
//            return head?.next
//        }
//        var q = lists[minI]
//        p?.next = q
//        p = p?.next
//        q = q?.next
//        if q == nil {
//            lists.remove(at: minI)
//        } else {
//            lists[minI] = q
//        }
//    }
//    return head?.next
//}
