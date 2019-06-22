//
//  60.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 我自己的回溯怎么也搞不定这题，总是超时，所以采用了评论区的做法
 
 */

func getPermutation(_ n: Int, _ k: Int) -> String {
    var res = ""
    var candidates: [Int] = []
    var f = Array.init(repeating: 0, count: n + 1)
    f[0] = 1
    var fact = 1
    for i in 1...n {
        candidates.append(i)
        fact *= i
        f[i] = fact
    }
    var k = k - 1
    for i in (0...n-1).reversed() {
        let index = k / f[i]
        res += "\(candidates.remove(at: index))"
        k -= index * f[i]
    }
    return res
}

//func getPermutation(_ n: Int, _ k: Int) -> String {
//    guard n > 0 else {
//        return ""
//    }
//    var nums: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//    nums = Array(nums[0..<n])
//    func _bt(_ res: inout String, _ count: inout Int, _ path: String, _ nums: [Int]) {
//        if path.count == n {
//            count += 1
//            res = path
//        } else if count < k {
//            for i in 0..<nums.count {
//                let n = nums[i]
//                var tmp = nums
//                tmp.remove(at: i)
//                _bt(&res, &count, path + "\(n)", tmp)
//            }
//        }
//    }
//    var res: String = ""
//    var count = 0
//    _bt(&res, &count, "", nums)
//    return res
//}
