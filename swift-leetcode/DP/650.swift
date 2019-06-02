//
//  650.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 来自评论区的解答
 如果这个数是质数 则这个数只能一个一个的复制得到 操作步数就是这个数本身 如果不是质数 则可以由复制得到
 例如20可以由10复制得到 10可以由5复制得到 而5是质数 只能一个一个复制 所以minStep(20) = 9
 
 */

func minSteps(_ n: Int) -> Int {
    guard n > 1 else {
        return 0
    }
    var res = 0
    var n = n
    for i in 2...n {
        while n % i == 0 {
            res += i
            n /= i
        }
    }
    return res
}
