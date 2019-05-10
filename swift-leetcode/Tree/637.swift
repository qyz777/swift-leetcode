//
//  637.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 level order，没啥难点
 */

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard root != nil else {
        return []
    }
    var queue: [TreeNode] = []
    var res: [Double] = []
    queue.append(root!)
    while !queue.isEmpty {
        var levelValue: Double = 0
        let count = queue.count
        for node in queue {
            queue.removeFirst()
            levelValue += Double(node.val)
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        res.append(levelValue / Double(count))
    }
    return res
}
