//
//  844.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️
 
 难点:
 没啥难点...
 
 */

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var stackS: [Character] = []
    var stackT: [Character] = []
    var s = Array(S)
    var t = Array(T)
    while !s.isEmpty {
        let first = s.removeFirst()
        if first == "#" {
            if !stackS.isEmpty {
                stackS.removeLast()
            }
        } else {
            stackS.append(first)
        }
    }
    while !t.isEmpty {
        let first = t.removeFirst()
        if first == "#" {
            if !stackT.isEmpty {
                stackT.removeLast()
            }
        } else {
            stackT.append(first)
        }
    }
    return stackS == stackT
}
