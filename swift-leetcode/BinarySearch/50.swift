//
//  50.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/5.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    if n < 0 {
        return 1 / myPow(x, -n)
    }
    if n % 2 == 0 {
        return myPow(x * x, n / 2)
    }
    return x * myPow(x, n - 1)
}


//func myPow(_ x: Double, _ n: Int) -> Double {
//    guard n != 0 else {
//        return 1
//    }
//
//    func _myPow(_ x: Double, _ n: Int) -> Double {
//        if n == 1 {
//            return x
//        }
//        let tempN = n % 2 == 0 ? n : n - 1
//        let more: Double = n % 2 == 0 ? 1 : 2
//        return _myPow(x, tempN / 2) * _myPow(x, tempN / 2) * more
//    }
//
//    return _myPow(n > 0 ? x : 1 / x, abs(n))
//}
