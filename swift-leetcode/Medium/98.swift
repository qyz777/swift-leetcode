//
//  98.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    func isValid(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard root != nil else {
            return true
        }
        if min != nil && root!.val <= min! {
            return false
        }
        if max != nil && root!.val >= max! {
            return false
        }
        return isValid(root?.left, min, root!.val) && isValid(root?.right, root!.val, max)
    }
    return isValid(root, nil, nil)
}
