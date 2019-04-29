//
//  39.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var list: [[Int]] = []
    getSum(&list, tempList: [], start: 0, candidates: candidates, target: target)
    return list
}

fileprivate func getSum(_ list: inout [[Int]], tempList: [Int], start: Int, candidates: [Int], target: Int) {
    var sum = 0
    for i in tempList {
        sum += i
    }
    if sum == target {
        list.append(tempList)
        return
    } else if sum > target {
        return
    }
    var t = tempList
    for i in start..<candidates.count {
        t.append(candidates[i])
        let nextStart = sum > target ? i + 1 : i
        getSum(&list, tempList: t, start: nextStart, candidates: candidates, target: target)
        t.remove(at: t.count - 1)
    }
}
