//
//  78.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var list: [[Int]] = []
    getSubsets(&list, tempList: [], nums: nums, start: 0)
    return list
}

fileprivate func getSubsets(_ list: inout [[Int]], tempList: [Int], nums: [Int], start: Int) {
    list.append(tempList)
    var t = tempList
    for i in start..<nums.count {
        t.append(nums[i])
        getSubsets(&list, tempList: t, nums: nums, start: i + 1)
        t.remove(at: t.count - 1)
    }
}
