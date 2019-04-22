//
//  1019.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func nextLargerNodes(_ head: ListNode?) -> [Int] {
    guard head != nil else {
        return []
    }
    var p = head
    var res: [Int] = []
    var nums: [Int] = []
    var stack: [Int] = []
    while p != nil {
        nums.append(p!.val)
        res.append(0)
        p = p?.next
    }
    for i in 0..<nums.count {
        while !stack.isEmpty && nums[i] > nums[stack.last!] {
            res[stack.popLast()!] = nums[i]
        }
        stack.append(i)
    }
    return res
}
