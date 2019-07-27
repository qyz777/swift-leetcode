//
//  55.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 回溯竟然超时了，干！
 
 动态规划
 dp[i - 1] = [i + 1...min(i + nums[i], nums.count - 1)] == true
 从后面往前看，只要i...i+nums[i]这一段都可以到达最后一个说明前面i - 1也可以到达
 
 */

func canJump(_ nums: [Int]) -> Bool {
    guard nums.count > 0 else {
        return false
    }
    guard nums.count > 1 else {
        return true
    }
    var dp = Array.init(repeating: false, count: nums.count)
    dp[dp.count - 1] = true
    for i in (0..<dp.count - 1).reversed() {
        let n = min(i + nums[i], dp.count - 1)
        for j in i...n {
            if dp[j] {
                dp[i] = true
                break
            }
        }
    }
    return dp.first!
}

//超时
//func canJump(_ nums: [Int]) -> Bool {
//    func _jump(_ i: Int, _ num: Int) -> Bool {
//        if i >= nums.count - 1 {
//            return true
//        }
//        guard num > 0 else {
//            return false
//        }
//        for j in 1...num {
//            let res = _jump(i + j, nums[i + j])
//            if res {
//                return res
//            }
//        }
//        return false
//    }
//    guard nums.count > 0 else {
//        return false
//    }
//    return _jump(0, nums[0])
//}
