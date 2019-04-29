//
//  96.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/7.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//f(0)=1，f(1)=1
//f(2)=f(1)f(0)+f(0)f(1)
//f(3)=f(2)f(0)+f(1)f(1)+f(0)f(2)
//.
//.
//.
//.
//f(n)=f(n-1)f(0)+f(n-2)f(1)+……….+f(1)f(n-2)+f(0)f(n-1)
//该数列称为卡特兰数（Catalan数）
//dp[2] =  dp[0] * dp[1]　　　(1为根的情况)
//
//    　　　　　　　　+ dp[1] * dp[0]　　  (2为根的情况)
//
//同理可写出 n = 3 的计算方法：
//
//dp[3] =  dp[0] * dp[2]　　　(1为根的情况)
//
//    　　　　　　　　+ dp[1] * dp[1]　　  (2为根的情况)
//
//        　　　  　　　  + dp[2] * dp[0]　　  (3为根的情况)

func numTrees(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    guard n > 1 else {
        return 1
    }
    var dp: [Int] = [1, 1]
    for i in 2...n {
        for j in 0..<i {
            if i > dp.count - 1 {
                dp.append(dp[j] * dp[i - 1 - j])
            } else {
                dp[i] += dp[j] * dp[i - 1 - j]
            }
        }
    }
    return dp.last!
}
