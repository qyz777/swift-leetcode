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

// MARK: 栈
public struct Stack<T> {
    fileprivate var array = [T]()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func push(_ element: T) {
        array.append(element)
    }
    public mutating func pop() -> T? {
        return array.popLast()
    }
    public var top: T? {
        return array.last
    }
}

func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    var sum = 0
    var stack: Stack<TreeNode> = Stack()
    if root != nil {
        stack.push(root!)
    }
    while stack.count > 0 {
        let node = stack.pop()
        if (node?.val)! >= L && (node?.val)! <= R {
            sum += (node?.val)!
        }
        if node?.left != nil {
            stack.push((node?.left)!)
        }
        if node?.right != nil {
            stack.push((node?.right)!)
        }
    }
    return sum
}

// MARK: 递归
//var sum = 0
//var tempL = 0
//var tempR = 0
//
//func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
//    tempL = L
//    tempR = R
//    searchBTS(root)
//    return sum
//}
//
//func searchBTS(_ root: TreeNode?) {
//    if root != nil {
//        if root!.val >= tempL && root!.val <= tempR {
//            sum += (root?.val)!
//        }
//        searchBTS(root?.left)
//        searchBTS(root?.right)
//    }
//}
