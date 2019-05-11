//
//  All Possible Full Binary Trees.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func allPossibleFBT(_ N: Int) -> [TreeNode?] {
    let tempN = N - 1
    if tempN == 0 {
        return [TreeNode.init(0)]
    }
    guard tempN > 0 else {
        return []
    }
    var result: [TreeNode] = []
    var index = 1
    for _ in 0..<tempN {
        if index > tempN {
            break
        }
        for left in allPossibleFBT(index) {
            for right in allPossibleFBT(tempN - index) {
                let node = TreeNode.init(0)
                node.left = left
                node.right = right
                result.append(node)
            }
        }
        index += 2
    }
    return result
}
