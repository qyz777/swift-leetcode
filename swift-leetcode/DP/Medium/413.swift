//
//  413.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/14.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//ref https://blog.csdn.net/prayyojay/article/details/52825415
func numberOfArithmeticSlices(_ A: [Int]) -> Int {
    guard A.count > 2 else {
        return 0
    }
    var res = 0
    var addLength = 0
    for i in 2..<A.count {
        if A[i - 1] - A[i - 2] == A[i] - A[i - 1] {
            addLength += 1
            res += addLength
        } else {
            addLength = 0
        }
    }
    return res
}

//func numberOfArithmeticSlices(_ A: [Int]) -> Int {
//    var res = 0
//    for i in 0..<A.count - 2 {
//        for j in i..<A.count - 2 {
//            if A[j + 2] - A[j + 1] == A[j + 1] - A[j] {
//                res += 1
//            } else {
//                break
//            }
//        }
//    }
//    return res
//}
