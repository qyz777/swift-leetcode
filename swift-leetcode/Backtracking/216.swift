//
//  219.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var res: [[Int]] = []
    let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    func _BT(_ res: inout [[Int]], _ temp: [Int], _ nums: [Int], _ k: Int, _ n: Int, _ start: Int) {
        if temp.count == k {
            if n == 0 {
                res.append(temp)
            }
            return
        } else {
            if start >= nums.count {
                return
            }
            var t = temp
            for i in start..<nums.count {
                let num = nums[i]
                let tempN = n - num
                t.append(num)
                _BT(&res, t, nums, k, tempN, i + 1)
                t.removeLast()
            }
        }
    }
    _BT(&res, [], nums, k, n, 0)
    return res
}
