//
//  22.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var list: [String] = []
    func _DFS(_ list: inout [String], _ str: String, _ n: Int, _ left: Int, _ right: Int) {
        if left == n && right == n {
            list.append(str)
            return
        } else {
            if left < n {
                _DFS(&list, str + "(", n, left + 1, right)
            }
            if left > right && right < n {
                _DFS(&list, str + ")", n, left, right + 1)
            }
        }
    }
    _DFS(&list, "", n, 0, 0)
    return list
}

//func generateParenthesis(_ n: Int) -> [String] {
//    var list: [String] = []
//    func _DFS(_ list: inout [String], _ str: String, _ start: Int, _ n: Int) {
//        if str.count == 2 * n {
//            var stack: [Character] = []
//            for c in str {
//                if stack.isEmpty {
//                    stack.append(c)
//                } else {
//                    if stack.last! == "(" {
//                        if c == ")" {
//                            stack.removeLast()
//                        } else {
//                            stack.append(c)
//                        }
//                    } else {
//                        return
//                    }
//                }
//            }
//            if !list.contains(str) && stack.isEmpty {
//                list.append(str)
//            }
//            return
//        } else {
//            var tempStr = str
//            for i in 0..<2*n {
//                for j in 0..<2 {
//                    let c: Character = j == 0 ? "(" : ")"
//                    tempStr.append(c)
//                    _DFS(&list, tempStr, i + 1, n)
//                    tempStr.removeLast()
//                }
//            }
//        }
//    }
//    _DFS(&list, "", 0, n)
//    return list
//}
