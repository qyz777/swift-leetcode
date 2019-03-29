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
}
