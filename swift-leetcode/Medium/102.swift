//
//  102.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func levelOrderReturnArray(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    var array: [[Int]] = []
    var queue: [TreeNode] = []
    queue.append(root!)
    while queue.count != 0 {
        var a: [Int] = []
        for _ in 0..<queue.count {
            let front = queue[0]
            a.append(front.val)
            if front.left != nil {
                queue.append(front.left!)
            }
            if front.right != nil {
                queue.append(front.right!)
            }
            queue.remove(at: 0)
        }
        array.append(a)
    }
    return array
}
