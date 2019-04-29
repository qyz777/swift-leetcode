//
//  106.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/12.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func buildTree2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard inorder.count > 0 && postorder.count > 0 else {
        return nil
    }
    let root = TreeNode.init(postorder.last!)
    var index = 0
    for node in inorder {
        if node == root.val {
            break
        }
        index += 1
    }
    if postorder.count > 0 {
        let leftIn = Array(inorder[0..<index])
        let leftPost = Array(postorder[0..<index])
        root.left = buildTree2(leftIn, leftPost)
    }
    if index + 1 < postorder.count {
        let rightIn = Array(inorder[index+1..<inorder.count])
        let rightPost = Array(postorder[index..<postorder.count-1])
        root.right = buildTree2(rightIn, rightPost)
    }
    return root
}
