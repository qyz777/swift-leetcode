//
//  215.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count >= k else {
        return 0
    }
    let nums = nums.sorted(by: {
        return $0 > $1
    })
    return nums[k - 1]
}
