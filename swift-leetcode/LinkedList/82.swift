//
//  82.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 删除排序链表中的重复元素 II
 
 上面是采用双指针删除
 下面采用的是先遍历一遍用字典保存出现的次数，然后再遍历一遍删掉
 
 */

func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return head
    }
    let newHead: ListNode? = ListNode.init(0)
    newHead?.next = head
    var p = newHead
    while p?.next != nil {
        var q = p?.next
        var isSame = false
        while q?.next != nil && q?.val == q?.next?.val {
            //q一直走到最后一个相等的指针
            q = q?.next
            isSame = true
        }
        if isSame {
            //如果有相等，删除这一段
            p?.next = q?.next
        } else {
            //没有相等就下一个
            p = p?.next
        }
    }
    return newHead?.next
}

//func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
//    guard head != nil else {
//        return head
//    }
//    var info: [Int: Int] = [:]
//    var p = head
//    //获取链表node的出现次数
//    while p != nil {
//        if info[p!.val] == nil {
//            info[p!.val] = 1
//        } else {
//            let count = info[p!.val]!
//            info[p!.val] = count + 1
//        }
//        p = p?.next
//    }
//    let tempHead = ListNode.init(0)
//    tempHead.next = head
//    p = tempHead
//    //删除node
//    while p?.next != nil {
//        let count = info[p!.next!.val]!
//        if count > 1 {
//            p?.next = p?.next?.next
//        } else {
//            p = p?.next
//        }
//    }
//    return tempHead.next
//}
