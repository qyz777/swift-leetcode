//
//  337.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

// 用后序遍历往上推
func rob(_ root: TreeNode?) -> Int {
    func _postOrder(_ root: TreeNode?) {
        if root?.left != nil {
            _postOrder(root?.left)
        }
        if root?.right != nil {
            _postOrder(root?.right)
        }
        var res1 = 0
        var res2 = root?.val ?? 0
        if root?.left != nil {
            res1 += root?.left?.val ?? 0
            if root?.left?.left != nil {
                res2 += root?.left?.left?.val ?? 0
            }
            if root?.left?.right != nil {
                res2 += root?.left?.right?.val ?? 0
            }
        }
        if root?.right != nil {
            res1 += root?.right?.val ?? 0
            if root?.right?.left != nil {
                res2 += root?.right?.left?.val ?? 0
            }
            if root?.right?.right != nil {
                res2 += root?.right?.right?.val ?? 0
            }
        }
        root?.val = max(res1, res2)
    }
    _postOrder(root)
    return root?.val ?? 0
}

//层序 + DP是不行的
//func rob(_ root: TreeNode?) -> Int {
//    guard root != nil else {
//        return 0
//    }
//    var queue: [TreeNode] = []
//    var valueArray: [Int] = []
//    queue.append(root!)
//    while !queue.isEmpty {
//        var value = 0
//        for _ in 0..<queue.count {
//            let node = queue.removeFirst()
//            value += node.val
//            if node.left != nil {
//                queue.append(node.left!)
//            }
//            if node.right != nil {
//                queue.append(node.right!)
//            }
//        }
//        valueArray.append(value)
//    }
//    var dp = Array.init(repeating: 0, count: valueArray.count)
//    var res = Int.min
//    for i in 0..<dp.count {
//        if i == 0 || i == 1 {
//            dp[i] = valueArray[i]
//        } else {
//            var maxValue = Int.min
//            for j in 0..<i-1 {
//                if dp[j] > maxValue {
//                    maxValue = dp[j]
//                }
//            }
//            dp[i] = maxValue + valueArray[i]
//        }
//        res = max(res, dp[i])
//    }
//    return res
//}
