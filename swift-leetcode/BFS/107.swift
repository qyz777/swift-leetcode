//
//  107.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    var array: [[Int]] = []
    var queue: [TreeNode] = []
    queue.append(root!)
    while !queue.isEmpty {
        var a: [Int] = []
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            a.append(node.val)
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        array.insert(a, at: 0)
    }
    return array
}
