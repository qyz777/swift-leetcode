//
//  662.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 假如根节点的下标是i，那么根节点的左子树下标是i * 2，右子树下标是 (i * 2) + 1
 
 知道这个规律之后只需要用层序遍历一次即可获得最大宽度
 值得注意的是这题我第一次挂在最后一个测试用例上了
 因为index的大小有可能超出Int的最大值，所以每次index % Int.max就不会报错了
 
 */

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    var queue: [(node: TreeNode, index: Int)] = []
    queue.append((node: root!, index: 1))
    var res = 1
    while !queue.isEmpty {
        // 每遍历一层，就把第一个节点和最后一个节点的下标相减，就能得到当前这层的最大宽度
        // 然后在与之前的最大值做比较
        res = max(res, queue.last!.index - queue.first!.index + 1)
        for t in queue {
            queue.removeFirst()
            if t.node.left != nil {
                // % Int.max是为了防止index超出Int最大值
                queue.append((node: t.node.left!, index: (t.index * 2) % Int.max))
            }
            if t.node.right != nil {
                queue.append((node: t.node.right!, index: (t.index * 2 + 1) % Int.max))
            }
        }
    }
    return res
}
