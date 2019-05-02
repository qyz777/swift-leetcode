//
//  71.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func simplifyPath(_ path: String) -> String {
    let splitArray = path.split(separator: "/")
    var stack: [String] = []
    for s in splitArray {
        if s == "." {
            continue
        } else if s == ".." {
            if !stack.isEmpty {
                stack.removeLast()
            }
        } else {
            stack.append(String(s))
        }
    }
    let res = "/" + stack.joined(separator: "/")
    return res
}

//下面这个方法我个人认为没问题，但是测试用例有一个是输入"/..."返回"/..."  ？？？这个是什么鬼:(
//func simplifyPath(_ path: String) -> String {
//    var chars = Array(path)
//    var stack: [Character] = []
//    while !chars.isEmpty {
//        let c = chars.removeFirst()
//        if c == "/" {
//            if stack.isEmpty || stack.last! != "/" {
//                stack.append(c)
//            }
//        } else if c == "." {
//            if !chars.isEmpty && chars.first! == "." {
//                if stack.count > 1 {
//                    stack.removeLast()
//                }
//                while !stack.isEmpty && stack.last! != "/" {
//                    stack.removeLast()
//                }
//            } else if !chars.isEmpty && chars.first! == "/" {
//                chars.removeFirst()
//            }
//        } else {
//            stack.append(c)
//        }
//    }
//    if stack.count > 1 && stack.last! == "/" {
//        stack.removeLast()
//    }
//    return String(stack)
//}
