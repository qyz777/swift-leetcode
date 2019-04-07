//
//  90.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var list: [[Int]] = []
    getSubsets(&list, temp: [], nums: nums, start: 0)
    return list
}

fileprivate func getSubsets(_ list: inout [[Int]], temp: [Int], nums: [Int], start: Int) {
    let l = temp.sorted(by: {
        return $1 > $0
    })
    if !list.contains(l) {
        list.append(l)
    }
    var tempList = temp
    for i in start..<nums.count {
        tempList.append(nums[i])
        getSubsets(&list, temp: tempList, nums: nums, start: i + 1)
        tempList.remove(at: tempList.count - 1)
    }
}
