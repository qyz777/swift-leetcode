//
//  817.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func numComponents(_ head: ListNode?, _ G: [Int]) -> Int {
    var p = head
    var count = 0
    var isConnect = false
    while p != nil {
        if G.contains(p!.val) {
            isConnect = true
            if p?.next == nil {
                count += 1
            }
        } else {
            if isConnect {
                count += 1
                isConnect = false
            }
        }
        p = p?.next
    }
    return count
}
