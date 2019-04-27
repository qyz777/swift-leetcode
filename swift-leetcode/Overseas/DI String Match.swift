//
//  DI String Match.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func diStringMatch(_ S: String) -> [Int] {
    var array: [Int] = []
    for i in 0...S.count {
        array.append(i)
    }
    var newArray: [Int] = []
    for s in S {
        if s == "I" {
            newArray.append(array.first!)
            array.remove(at: 0)
        } else {
            newArray.append(array.last!)
            array.remove(at: array.count - 1)
        }
    }
    return newArray + array
}
