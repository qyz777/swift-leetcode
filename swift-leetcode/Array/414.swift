//
//  414.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/19.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 题目要求O(n)的时间复杂度解决，通过三个变量传递值就可以完成
 
 */

func thirdMax(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var num1 = Int.min
    var num2 = Int.min
    var num3 = Int.min
    for n in nums {
        if n > num1 {
            swap(&num3, &num2)
            swap(&num1, &num2)
            num1 = n
        } else if n > num2 && n < num1 {
            swap(&num2, &num3)
            num2 = n
        } else if n > num3 && n < num2 {
            num3 = n
        }
    }
    return num3 == Int.min ? num1 : num3
}
