//
//  16.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 2 else {
        return target
    }
    let nums = nums.sorted()
    var res: Int = nums[0] + nums[1] + nums[2]
    for i in 0..<nums.count - 2 {
        var left = i + 1
        var right = nums.count - 1
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            } else {
                return target
            }
            if abs(target - sum) < abs(target - res) {
                res = sum
            }
        }
    }
    return res
}

//func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
//    var res: Int?
//    func _BT(_ res: inout Int?, _ used: [Int], _ nums: [Int], _ target: Int) {
//        if used.count == 3 {
//            let sum = used[0] + used[1] + used[2]
//            if res == nil {
//                res = sum
//                return
//            }
//            if abs(target - sum) < abs(target - res!) {
//                res = sum
//            }
//            return
//        }
//        var u = used
//        for i in 0..<nums.count {
//            u.append(nums[i])
//            var tempNums = nums
//            tempNums.remove(at: i)
//            _BT(&res, u, tempNums, target)
//            u.removeLast()
//        }
//    }
//    _BT(&res, [], nums, target)
//    return res!
//}
