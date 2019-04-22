//
//  ListNode.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public static func generateListNode(_ nums: [Int]) -> ListNode? {
        guard nums.count > 0 else {
            return nil
        }
        let head = ListNode.init(nums.first!)
        var p = head
        for i in 1..<nums.count {
            p.next = ListNode.init(nums[i])
            p = p.next!
        }
        return head
    }
}
