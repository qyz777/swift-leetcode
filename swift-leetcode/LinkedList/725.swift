//
//  725.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
    var queue: [ListNode] = []
    var res: [ListNode?] = []
    var p = root
    while p != nil {
        queue.append(p!)
        p = p?.next
    }
    if queue.count > k {
        let length = queue.count / k
        let frontCount = queue.count % k
        var index = 0
        var count = 0
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let nodeLength = index < frontCount ? length + 1 : length
            count += 1
            if count == 1 {
                res.append(node)
            }
            if count == nodeLength {
                count = 0
                node.next = nil
                index += 1
            }
        }
    } else {
        let nilCount = k - queue.count
        while !queue.isEmpty {
            let node = queue.removeFirst()
            node.next = nil
            res.append(node)
        }
        for _ in 0..<nilCount {
            res.append(res.last??.next)
        }
    }
    return res
}
