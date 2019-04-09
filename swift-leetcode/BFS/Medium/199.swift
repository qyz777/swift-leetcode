//
//  199.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var res: [Int] = []
    var queue: [TreeNode] = []
    queue.append(root!)
    while !queue.isEmpty {
        res.append(queue.last!.val)
        for _ in 0..<queue.count {
            let front = queue.removeFirst()
            if front.left != nil {
                queue.append(front.left!)
            }
            if front.right != nil {
                queue.append(front.right!)
            }
        }
    }
    return res
}
