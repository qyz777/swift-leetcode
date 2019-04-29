//
//  95.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func generateTrees(_ n: Int) -> [TreeNode?] {
    guard n > 0 else {
        return []
    }
    func buildTree(_ left: Int, _ right: Int) -> [TreeNode?] {
        var array: [TreeNode?] = []
        if left > right {
            array.append(nil)
            return array
        }
        for i in left...right {
            let leftArray = buildTree(left, i - 1)
            let rightArray = buildTree(i + 1, right)
            for j in 0..<leftArray.count {
                for k in 0..<rightArray.count {
                    let newHead = TreeNode.init(i)
                    newHead.left = leftArray[j]
                    newHead.right = rightArray[k]
                    array.append(newHead)
                }
            }
        }
        return array
    }
    return buildTree(1, n)
}
