//
//  46.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var list: [[Int]] = []
    getPermute(&list, temp: [], nums: nums)
    return list
}

fileprivate func getPermute(_ list: inout [[Int]], temp: [Int], nums: [Int]) {
    if temp.count == nums.count {
        list.append(temp)
        return
    }
    var t = temp
    for i in nums {
        if t.contains(i) {
            continue
        }
        t.append(i)
        getPermute(&list, temp: t, nums: nums)
        t.remove(at: t.count - 1)
    }
}
