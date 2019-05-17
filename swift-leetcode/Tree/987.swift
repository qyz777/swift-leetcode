//
//  987.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 注意题目要求”如果两个结点位置相同，则首先报告的结点值较小。“
 
 解法其实很简单，就是dfs然后把每个列的值放在一个字典里，之后再排序返回结果即可
 
 */

func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    //key代表第几列，value是一个元组，元组中的depth用来排序，因为题目要求结果中每一个元素按照depth排序
    var info: [Int: [(value: Int, depth: Int)]] = [:]
    func _dfs(_ info: inout [Int: [(value: Int, depth: Int)]], _ col: Int, _ root: TreeNode?, _ depth: Int) {
        guard root != nil else {
            return
        }
        if info[col] == nil {
            info[col] = [(value: root!.val, depth: depth)]
        } else {
            var array = info[col]!
            for i in 0..<array.count {
                let tuple = array[i]
                if depth < tuple.depth {
                    //小于插前面
                    array.insert((value: root!.val, depth: depth), at: i)
                    break
                } else if depth == tuple.depth {
                    //此时说明depth相等的有多个，遍历到条件符合为止
                    if i + 1 < array.count &&
                        array[i + 1].depth == depth &&
                        array[i + 1].value < root!.val {
                        continue
                    }
                    if root!.val < tuple.value {
                        array.insert((value: root!.val, depth: depth), at: i)
                    } else {
                        array.insert((value: root!.val, depth: depth), at: i + 1)
                    }
                    break
                }
            }
            //这个时候说明是最大，插在最后面
            if array.count == info[col]!.count {
                array.append((value: root!.val, depth: depth))
            }
            info[col] = array
        }
        _dfs(&info, col - 1, root?.left, depth + 1)
        _dfs(&info, col + 1, root?.right, depth + 1)
    }
    _dfs(&info, 0, root, 0)
    let tuple = info.sorted(by: {
        return $0.key < $1.key
    })
    var res: [[Int]] = []
    for (_, v) in tuple {
        var array: [Int] = []
        for e in v {
            array.append(e.value)
        }
        res.append(array)
    }
    return res
}
