//
//  347.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 看到题目归类在堆下，于是写了一个堆排序...
 其实我觉得这样的话不如写一个快排更快
 
 突然想到了大顶堆删除堆顶再shiftDown的思路，刚才怎么没想到呢🤦‍♀️
 
 */

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    guard !nums.isEmpty else {
        return []
    }
    var info: [Int: Int] = [:] //key为num，value为数量
    for num in nums {
        if info[num] == nil {
            info[num] = 1
        } else {
            info[num] = info[num]! + 1
        }
    }
    //向下调整
    func _shiftDown(_ array: inout [(num: Int, count: Int)], _ n: Int, _ i: Int) {
        var i = i
        while i < n {
            var p = i
            if i * 2 + 1 < n && array[i].count > array[i * 2 + 1].count {
                p = i * 2 + 1
            }
            if i * 2 + 2 < n && array[p].count > array[i * 2 + 2].count {
                p = i * 2 + 2
            }
            if p == i {
                break
            } else {
                array.swapAt(p, i)
                i = p
            }
        }
    }
    var array: [(num: Int, count: Int)] = []
    for (k, v) in info {
        array.append((num: k, count: v))
    }
    for i in (0..<(array.count / 2)).reversed() {
        _shiftDown(&array, array.count, i)
    }
    for i in (0..<array.count).reversed() {
        array.swapAt(0, i)
        _shiftDown(&array, i, 0)
    }
    var res: [Int] = []
    for i in 0..<k {
        res.append(array[i].num)
    }
    return res
}
