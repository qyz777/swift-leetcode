//
//  998.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题没有解释清楚，这题的本意是要把val append到Construct之后
 也就是题目的意思只能插在右子树上或者作为根节点
 
 */

func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard root != nil else {
//        这里要注意因为有val，怎么用都不会返回nil
        return TreeNode.init(val)
    }
    if val > root!.val {
        let newHead = TreeNode.init(val)
        newHead.left = root
        return newHead
    }
    root?.right = insertIntoMaxTree(root?.right, val)
    return root
}
