//
//  108.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard nums.count > 0 else {
        return nil
    }
    let mid = nums.count / 2
    let leftArray = Array(nums[0..<mid])
    let rightArray = Array(nums[mid+1..<nums.count])
    let root = TreeNode.init(nums[mid])
    root.left = sortedArrayToBST(leftArray)
    root.right = sortedArrayToBST(rightArray)
    return root
}
