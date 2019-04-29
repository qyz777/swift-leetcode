//
//  526.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func countArrangement(_ N: Int) -> Int {
    var res = 0
    var nums: [Int] = []
    for i in 0..<N {
        nums.append(i + 1)
    }
    func _BT(_ res: inout Int, _ path: [Int], _ nums: [Int], _ used: [Int: Int]) {
        if nums.count == 0 {
            res += 1
        } else {
            var path = path
            var used = used
            for i in 0..<nums.count {
                let index = path.count + 1
                let num = nums[i]
                if (num % index == 0 || index % num == 0) && used[num] == nil {
                    path.append(num)
                    var nums = nums
                    nums.remove(at: i)
                    used[num] = 1
                    _BT(&res, path, nums, used)
                    path.removeLast()
                    used.removeValue(forKey: num)
                }
            }
        }
    }
    _BT(&res, [], nums, [:])
    return res
}
