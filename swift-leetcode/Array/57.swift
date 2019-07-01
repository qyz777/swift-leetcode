//
//  57.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 在区间内就合并，不在就放过或者加入res
 
 */

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    guard !intervals.isEmpty else {
        return [newInterval]
    }
    var res: [[Int]] = []
    var newInterval = newInterval
    for interval in intervals {
        if newInterval[1] < interval[0] {
            //newInterval区间在interval前面，可以加入res
            res.append(newInterval)
            newInterval = interval
        } else if newInterval[0] > interval[1] {
            //interval的区间在newInterval前面，可以加入res
            res.append(interval)
        } else {
            //interval和newInterval有交集合并
            newInterval[0] = min(newInterval[0], interval[0])
            newInterval[1] = max(newInterval[1], interval[1])
        }
    }
    res.append(newInterval)
    return res
}
