//
//  700.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 无难点
 
 很基础的考到了BST的性质，即左子树永远小于根节点，右子树永远大于根节点
 
 */

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var cur = root
    while cur != nil {
        if val > cur!.val {
            cur = cur?.right
        } else if val < cur!.val {
            cur = cur?.left
        } else {
            return cur
        }
    }
    return nil
}
