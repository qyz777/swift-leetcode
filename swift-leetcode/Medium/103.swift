//
//  103.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    var array: [[Int]] = []
    var queue: [TreeNode] = []
    queue.append(root!)
    var index = 1
    while queue.count != 0 {
        var s: Stack<Int> = Stack()
        var q: [Int] = []
        for _ in 0..<queue.count {
            let front = queue.first!
            if index % 2 == 0 {
                s.push(front.val)
            } else {
                q.append(front.val)
            }
            if front.left != nil {
                queue.append(front.left!)
            }
            if front.right != nil {
                queue.append(front.right!)
            }
            queue.remove(at: 0)
        }
        index += 1
        while !s.isEmpty {
            q.append(s.pop()!)
        }
        array.append(q)
    }
    return array
}
