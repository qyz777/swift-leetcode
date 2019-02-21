//
//  Maximum Binary Tree.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    guard nums.count != 0 else {
        return nil
    }
    var node: TreeNode?
    var maxNum = 0
    var index = 0
    var count = 0
    for num in nums {
        if maxNum < num {
            maxNum = num
            index = count
        }
        count += 1
    }
    node = TreeNode.init(maxNum)
    var leftArray: [Int] = []
    var rightArray: [Int] = []
    for i in 0..<nums.count {
        let num = nums[i]
        if i < index {
            leftArray.append(num)
        } else if i > index {
            rightArray.append(num)
        }
    }
    node!.left = constructMaximumBinaryTree(leftArray)
    node!.right = constructMaximumBinaryTree(rightArray)
    return node
}
