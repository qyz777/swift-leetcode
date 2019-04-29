//
//  105.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/31.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0 && inorder.count > 0 else {
        return nil
    }
    let node = TreeNode.init(preorder.first!)
    if preorder.count == 1 {
        return node
    }
    var index = 0
    for i in inorder {
        if i == preorder.first! {
            break
        }
        index += 1
    }
    var leftPre: [Int] = []
    var leftIn: [Int] = []
    var rightPre: [Int] = []
    var rightIn: [Int] = []
    for i in 0..<preorder.count {
        if i < index {
            leftPre.append(preorder[i + 1])
            leftIn.append(inorder[i])
        } else if i > index {
            rightPre.append(preorder[i])
            rightIn.append(inorder[i])
        }
    }
    node.left = buildTree(leftPre, leftIn)
    node.right = buildTree(rightPre, rightIn)
    return node
}
