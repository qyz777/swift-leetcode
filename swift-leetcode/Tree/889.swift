//
//  889.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 来自官方题解:
 
 前序遍历为：(根结点) (前序遍历左分支) (前序遍历右分支)
 而后序遍历为：(后序遍历左分支) (后序遍历右分支) (根结点)
 
 例如，如果最终的二叉树可以被序列化的表述为 [1, 2, 3, 4, 5, 6, 7]，那么其前序遍历为 [1] + [2, 4, 5] + [3, 6, 7]，而后序遍历为 [4, 5, 2] + [6, 7, 3] + [1].
 
 我们令左分支有 L 个节点。我们知道左分支的头节点为 pre[1]，但它也出现在左分支的后序表示的最后。所以 pre[1] = post[L-1]（因为结点的值具有唯一性），因此 L = post.indexOf(pre[1]) + 1。
 
 现在在我们的递归步骤中，左分支由 pre[1 : L+1] 和 post[0 : L] 重新分支，而右分支将由 pre[L+1 : N] 和 post[L : N-1] 重新分支。
 
 */

func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
    guard !pre.isEmpty && !post.isEmpty else {
        return nil
    }
    let root = TreeNode.init(pre.first!)
    if pre.count == 1 {
        return root
    }
    //找左子树根节点
    var i = 0
    for n in post {
        if n == pre[1] {
            break
        }
        i += 1
    }
    //这里根据题解分割数组即可
    root.left = constructFromPrePost(Array(pre[1...i+1]), Array(post[0...i]))
    root.right = constructFromPrePost(Array(pre[i+2..<pre.count]), Array(post[i+1..<post.count-1]))
    return root
}
