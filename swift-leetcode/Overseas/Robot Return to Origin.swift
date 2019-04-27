//
//  Robot Return to Origin.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func judgeCircle(_ moves: String) -> Bool {
    var num = 0
    for s in moves {
        if s == "U" {
            num += 1
        } else if s == "D" {
            num -= 1
        } else if s == "L" {
            num += 2
        } else if s == "R" {
            num -= 2
        }
    }
    return num == 0
}
