//
//  222.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func countNodes(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    var res = 0
    var queue: [TreeNode] = []
    queue.append(root!)
    while !queue.isEmpty {
        res += queue.count
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
    }
    return res
}
