//
//  TreeNode.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public class func generateTree(_ nums: [Int?]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }
        var nums = nums
        let root = TreeNode.init(nums.removeFirst() ?? 0)
        var queue: [TreeNode] = [root]
        while !nums.isEmpty {
            var tempQueue: [TreeNode] = []
            while !queue.isEmpty {
                let p = queue.removeFirst()
                if !nums.isEmpty, let left = nums.removeFirst() {
                    p.left = TreeNode.init(left)
                    tempQueue.append(p.left!)
                }
                if !nums.isEmpty, let right = nums.removeFirst() {
                    p.right = TreeNode.init(right)
                    tempQueue.append(p.right!)
                }
            }
            queue = tempQueue
        }
        return root
    }
}
