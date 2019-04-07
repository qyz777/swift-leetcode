//
//  Sort Array By Parity.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var arrayF: [Int] = []
    var arrayS: [Int] = []
    for a in A {
        if a % 2 == 0 {
            arrayF.append(a)
        } else {
            arrayS.append(a)
        }
    }
    return arrayF + arrayS
}
