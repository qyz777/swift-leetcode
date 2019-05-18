//
//  394.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 需要考虑到重复的次数可能是多位数，所以匹配数字的时候要多往后看一下，我第一次提交就挂在这里了
 
 思路很简单，就是匹配[]，匹配到]了就说明可以重复[]之间的字符了
 但是需要把重复的次数和重复的字符串分开放在两个栈中
 
 */

func decodeString(_ s: String) -> String {
    var stackNum: [Int] = []//数字栈
    var stackStr: [String] = []//字符栈
    var s = s
    var res = ""
    while !s.isEmpty {
        var c = String(s.removeFirst())
        //获取需要重复的数量存在数字栈里
        if c >= "0" && c <= "9" {
            while !s.isEmpty && s.first! >= "0" && s.first! <= "9" {
                c += String(s.removeFirst())
            }
            stackNum.append(Int(c)!)
        } else if c == "[" {
            stackStr.append(c)
        } else if c == "]" {
            //匹配到]说明需要生成一段重复的字符串了
            var str = ""
            while stackStr.last! != "[" {
                str = stackStr.popLast()! + str
            }
            stackStr.removeLast()
            let num = stackNum.popLast()!
            //重复num次str
            str = String.init(repeating: str, count: num)
            stackStr.append(str)
        } else {
            stackStr.append(c)
        }
    }
    res = stackStr.joined()
    return res
}
