//
//  842.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题是来自题解区的思路，通过BT返回true or false来判断是否找到
 第一次发现可以这么做，与一般的回溯模板不太一样
 
 注意每个数在 2^31 - 1 以内...
 
 */

func splitIntoFibonacci(_ S: String) -> [Int] {
    guard S.count > 3 else {
        return []
    }
    var res: [Int] = []
    func _bt(_ res: inout [Int], _ nums: [Character]) -> Bool {
        if res.count >= 3 && nums.isEmpty {
            return true
        }
        for i in 0..<nums.count {
            if Int(String(nums[0...i]))! > Int(powf(2, 31) - 1) {
                break
            }
            if i > 0 && nums[0] == "0" {
                continue
            }
            if res.count < 2 {
                res.append(Int(String((nums[0...i])))!)
                if _bt(&res, Array(nums[i+1..<nums.count])) {
                    return true
                }
                res.removeLast()
            } else {
                let next = Int(String((nums[0...i])))!
                let sum = res.last! + res[res.count - 2]
                if sum == next {
                    res.append(next)
                    if _bt(&res, Array(nums[i+1..<nums.count])) {
                        return true
                    }
                    res.removeLast()
                } else if sum < next {
                    return false
                }
            }
        }
        return false
    }
    if _bt(&res, Array(S)) {
        return res
    }
    return []
}
