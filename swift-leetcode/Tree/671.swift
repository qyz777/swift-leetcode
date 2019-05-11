//
//  671.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 一次遍历解决
 
 我这里用了超暴力的方法，但是看到有题解可以用in order解决，这里贴一下
 
func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    typealias SecondMin = (min : Int,secondMin: Int)
    var result : SecondMin = (-1,-1)
    func inorder(_ root : TreeNode?) {
        if nil == root {
            return
        }
        inorder(root?.left)
        let value = (root?.val)!
        if result.min == -1 {
            result.min = value
        } else {
            if result.secondMin == -1 {
                if result.min > value {
                    result.secondMin = result.min
                    result.min = value
                }
                if result.min < value {
                    result.secondMin = value
                }
            } else {
                if result.min > value {
                    result.secondMin = result.min
                    result.min = value
                } else if result.secondMin > value && result.min != value {
                    result.secondMin = value
                }
            }
        }
        inorder(root?.right)
    }
    inorder(root)
    return result.secondMin
}
 
 */

func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    var queue: [TreeNode] = []
    queue.append(root!)
    var array: [Int] = []
    var res = Int.min
    // pre order
    while !queue.isEmpty {
        let node = queue.removeFirst()
        array.append(node.val)
        if node.left != nil {
            queue.append(node.left!)
        }
        if node.right != nil {
            queue.append(node.right!)
        }
    }
    // 拿到所有节点的值，排个序
    array.sort(by: {
        return $0 < $1
    })
    // 取第二个小的即可
    if array.count == 1 || array.last! == array.first! {
        res = -1
    } else {
        while array.count > 1 && array[0] == array[1] {
            array.removeFirst()
        }
        res = array[1]
    }
    return res
}
