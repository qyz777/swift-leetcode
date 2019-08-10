//
//  29.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 参考:https://leetcode-cn.com/problems/divide-two-integers/solution/an-er-fen-cha-zhao-mo-ban-xie-de-by-ao-ye-zhen-tou/
 
 */

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    guard divisor != 0 else {
        return -1
    }
    guard dividend != 0 else {
        return 0
    }
    
    if dividend == Int32.min && divisor == -1 {
        return Int(Int32.max)
    }
    
    var res = 0
    let negetive = (dividend ^ divisor) < 0
    var count = 1
    var dividendTmp = abs(dividend)
    var divisorTmp = abs(divisor)
    while dividendTmp >= divisorTmp {
        dividendTmp -= divisorTmp
        res += count
        if dividendTmp < abs(divisor) {
            break
        }
        //无法加倍时就重新初始化，再开始加倍
        if dividendTmp - divisorTmp < divisorTmp {
            divisorTmp = abs(divisor)
            count = 1
            continue
        }
        //不断加倍直到和dividendTmp一样大
        divisorTmp += divisorTmp
        count += count
    }
    
    return negetive ? -res : res
}
