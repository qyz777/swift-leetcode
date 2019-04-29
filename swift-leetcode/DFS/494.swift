//
//  494.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/8.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    func _DFS(_ res: inout Int, _ num: Int, _ nums: [Int], _ S: Int, _ index: Int) {
        if index == nums.count {
            if num == S {
                res += 1
            }
        } else {
            _DFS(&res, num + nums[index], nums, S, index + 1)
            _DFS(&res, num - nums[index], nums, S, index + 1)
        }
    }
    var res = 0
    _DFS(&res, 0, nums, S, 0)
    return res
}
