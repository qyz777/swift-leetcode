//
//  113.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    guard root != nil else {
        return []
    }
    var array: [[Int]] = []
    func _pathSum(_ root: TreeNode, _ sum: Int, _ path: [Int], _ allPath: inout [[Int]]) {
        var tempPath = path
        tempPath.append(root.val)
        if root.left == nil && root.right == nil && root.val == sum {
            allPath.append(tempPath)
        }
        if root.left != nil {
            _pathSum(root.left!, sum - root.val, tempPath, &allPath)
        }
        if root.right != nil {
            _pathSum(root.right!, sum - root.val, tempPath, &allPath)
        }
    }
    _pathSum(root!, sum, [], &array)
    return array
}

//fileprivate func _pathSum(_ root: TreeNode, _ sum: Int, _ path: [Int], _ allPath: inout [[Int]]) {
//    var tempPath = path
//    tempPath.append(root.val)
//    if root.left == nil && root.right == nil && root.val == sum {
//        allPath.append(tempPath)
//    }
//    if root.left != nil {
//        _pathSum(root.left!, sum - root.val, tempPath, &allPath)
//    }
//    if root.right != nil {
//        _pathSum(root.right!, sum - root.val, tempPath, &allPath)
//    }
//}
