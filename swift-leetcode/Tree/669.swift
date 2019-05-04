//
//  669.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
    guard root != nil else {
        return root
    }
    if root!.val < L {
        return trimBST(root?.right, L, R)
    } else if root!.val > R {
        return trimBST(root?.left, L, R)
    }
    root?.left = trimBST(root?.left, L, R)
    root?.right = trimBST(root?.right, L, R)
    return root
}
