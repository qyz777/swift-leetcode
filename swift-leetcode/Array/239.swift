//
//  239.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

//func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//    guard nums.count != 0 else {
//        return []
//    }
//    var queue: [Int] = []
//    var array: [Int] = []
//    var maxNum = nums.first!
//    for i in 0..<k {
//        if nums[i] > maxNum {
//            maxNum = nums[i]
//        }
//        queue.append(nums[i])
//    }
//    array.append(maxNum)
//    for i in k..<nums.count {
//        queue.remove(at: 0)
//        queue.append(nums[i])
//        var maxNum = queue.first!
//        for n in queue {
//            if n > maxNum {
//                maxNum = n
//            }
//        }
//        array.append(maxNum)
//    }
//    return array
//}

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count != 0 else {
        return []
    }
    var queue: [Int] = []
    var res: [Int] = []
    for i in 0..<nums.count {
        let n = nums[i]
        if i >= k && queue.first! <= i - k {
            queue.remove(at: 0)
        }
        while queue.count > 0 {
            if nums[queue.last!] <= n {
                _ = queue.popLast()
            } else {
                break
            }
        }
        queue.append(i)
        if i >= k - 1 {
            res.append(nums[queue.first!])
        }
    }
    return res
}
