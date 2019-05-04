//
//  Distribute Coins in Binary Tree.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func distributeCoins(_ root: TreeNode?) -> Int {
    var moveCount = 0
    func _DFS(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        let left = _DFS(root?.left)
        let right = _DFS(root?.right)
        
        moveCount += abs(left) + abs(right)
        return root!.val + left + right - 1
    }
    _ = _DFS(root)
    return moveCount
}
