//
//  Range Sum of BST.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

var sum = 0
var tempL = 0
var tempR = 0

func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    tempL = L
    tempR = R
    searchBTS(root)
    return sum
}

func searchBTS(_ root: TreeNode?) {
    if root != nil {
        if root!.val >= tempL && root!.val <= tempR {
            sum += (root?.val)!
        }
        searchBTS(root?.left)
        searchBTS(root?.right)
    }
}
