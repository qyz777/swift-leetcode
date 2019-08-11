//
//  331.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/11.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 从后往前两个#号可以判断一个节点是正常的，去掉两个#号把这个节点变成一个#号(也就是去掉一个#号)
 最后只要只有一个#号说明从下往上都满足树的条件
 
 */

func isValidSerialization(_ preorder: String) -> Bool {
    let preorderArray = Array(preorder)
    var i = preorderArray.count - 1
    var num = 0
    while i >= 0 {
        if preorderArray[i] == "," {
            i -= 1
            continue
        }
        if preorderArray[i] == "#" {
            //储存#号个数
            num += 1
        } else {
            while i > 0 && preorderArray[i] != "," {
                i -= 1
            }
            if num >= 2 {
                //#号满两个换一个
                num -= 1
            } else {
                return false
            }
        }
        i -= 1
    }
    //最后只要换到#号只有一个了才满足题意
    if num != 1 {
        return false
    }
    return true
}
