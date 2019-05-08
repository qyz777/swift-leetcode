//
//  515.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func largestValues(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var queue: [TreeNode] = []
    var res: [Int] = []
    queue.append(root!)
    while !queue.isEmpty {
        var maxValue = Int.min
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            maxValue = max(maxValue, node.val)
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        res.append(maxValue)
    }
    return res
}
