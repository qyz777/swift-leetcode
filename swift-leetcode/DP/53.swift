//
//  53.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var tempSum = 0
    var maxSum: Int?
    for num in nums {
        tempSum = max(tempSum + num, num)
        if maxSum == nil {
            maxSum = tempSum
        } else {
            if tempSum > maxSum! {
                maxSum = tempSum
            }
        }
    }
    return maxSum ?? 0
}
