//
//  47.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var res: Set<[Int]> = []
    func _BT(_ res: inout Set<[Int]>, _ temp: [Int], _ nums: [Int]) {
        if nums.count == 0 {
            res.insert(temp)
            return
        } else {
            var t = temp
            for i in 0..<nums.count {
                let n = nums[i]
                var tempNums = nums
                tempNums.remove(at: i)
                t.append(n)
                _BT(&res, t, tempNums)
                t.removeLast()
            }
        }
    }
    _BT(&res, [], nums)
    return Array(res)
}
