//
//  21.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 合并两个有序链表(升序)
 
 我的实现是使用一个新的头指针用来保存合并后的链表，最后返回新的头指针的next即可
 其实不用新的头指针也行
 
 */

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var p = l1
    var q = l2
    let newHead = ListNode.init(0)
    var j = newHead
    while p != nil && q != nil {
        //j用来在合并的链表上移动
        //p < q就然后j的next指向p，反之j的next指向q
        //然后j = j.next就移动到下一个
        if p!.val < q!.val {
            j.next = p
            p = p?.next
        } else {
            j.next = q
            q = q?.next
        }
        j = j.next!
    }
    //要考虑到合并完链表还会有剩余node的情况
    if p != nil {
        j.next = p
    } else if q != nil {
        j.next = q
    }
    return newHead.next
}
