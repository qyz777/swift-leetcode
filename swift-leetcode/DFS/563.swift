//
//  563.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findTilt(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    func _DFS(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return _DFS(root?.left) + _DFS(root?.right) + root!.val
    }
    
    return findTilt(root?.left) + findTilt(root?.right) + abs(_DFS(root?.left) - _DFS(root?.right))
}
