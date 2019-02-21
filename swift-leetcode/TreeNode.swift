//
//  TreeNode.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
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
