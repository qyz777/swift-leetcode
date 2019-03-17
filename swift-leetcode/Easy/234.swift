//
//  234.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    guard head != nil && head?.next != nil else {
        return true
    }
    var array: [Int] = []
    var p = head
    var q = head?.next?.next
    while p?.next != nil && q?.next?.next != nil {
        p = p?.next
        q = q?.next?.next
    }
    p = p?.next
    var tempP = p
    if p?.next != nil {
        tempP = p?.next
    }
    while tempP != nil {
        array.append(tempP!.val)
        tempP = tempP?.next
    }
    array.reverse()
    var leftP = head
    for num in array {
        if leftP == nil {
            return false
        }
        if leftP?.val != num  {
            return false
        }
        leftP = leftP?.next
    }
    return true
}
