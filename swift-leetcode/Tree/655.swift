//
//  655.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 找规律，找到宽和高的规律
 
 有了宽和高，二分往中间填表就完事了
 */

func printTree(_ root: TreeNode?) -> [[String]] {
    guard root != nil else {
        return []
    }
    var matrix: [[String]] = []
    var queue: [TreeNode] = []
    queue.append(root!)
    var nodeMatrix: [[TreeNode]] = []
    var i = 0
    var column = 0
    while !queue.isEmpty {
        column += Int(pow(2, Double(i)))
        nodeMatrix.append(queue)
        for node in queue {
            queue.removeFirst()
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        i += 1
    }
    for _ in 0..<i {
        matrix.append(Array.init(repeating: "", count: column))
    }
    func _fillForm(_ form: inout [[String]], _ root: TreeNode?, _ row: Int, _ left: Int, _ right: Int) {
        guard root != nil else {
            return
        }
        let column = (left + right) / 2
        form[row][column] = "\(root!.val)"
        _fillForm(&form, root?.left, row + 1, left, column)
        _fillForm(&form, root?.right, row + 1, column, right)
    }
    _fillForm(&matrix, root, 0, 0, matrix.first!.count)
    return matrix
}
