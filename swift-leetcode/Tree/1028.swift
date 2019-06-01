//
//  1028.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 一开始看到这题的时候我认为要用栈去做，但是我发现直接递归就可以完成了
 每个val前的分割线数量可以确定左子树和右子树，接着递归就可以解了
 
 */

func recoverFromPreorder(_ S: String) -> TreeNode? {
    guard S.count > 0 else {
        return nil
    }
    var S = S
    var val = ""
    //获取根节点的val
    while !S.isEmpty && S.first! != "-" {
        val += String(S.removeFirst())
    }
    let head = TreeNode.init(Int(val)!)
    var lineCount = 0
    //计算分割线的数量
    while !S.isEmpty && !("0" <= S.first! && S.first! <= "9") {
        S.removeFirst()
        lineCount += 1
    }
    //以下为找到右子树，通过上面的分割线数量确定，左右子树前面的分割线数量是相等的
    var tmp = 0
    var leftEnd = 0
    var rightStart = 0
    let tmpS = Array(S)
    for i in 0..<tmpS.count {
        let c = tmpS[i]
        if c >= "0" && c <= "9" {
            if tmp == lineCount {
                leftEnd = i - tmp
                rightStart = i
                break
            }
            tmp = 0
        } else {
            tmp += 1
        }
    }
    //分割成两半递归就完事了
    let leftS = String(S[S.startIndex..<S.index(S.startIndex, offsetBy: leftEnd)])
    let rightS = String(S[S.index(S.startIndex, offsetBy: rightStart)..<S.endIndex])
    if leftS.isEmpty {
        head.left = recoverFromPreorder(rightS)
    } else {
        head.left = recoverFromPreorder(leftS)
        head.right = recoverFromPreorder(rightS)
    }
    return head
}
