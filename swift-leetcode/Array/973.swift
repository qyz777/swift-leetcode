//
//  973.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/24.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 Review Level:⭐️⭐️⭐️⭐️⭐️
 
 既然题目归类在分治下，那就用归并排序（分治）先排序，再取前K个即可
 
 */

func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
    guard K < points.count else {
        return points
    }
    func _mergeSort(_ data: inout [[Int]], _ low: Int, _ high: Int) {
        if low < high {
            let mid = (low + high) / 2
            _mergeSort(&data, low, mid)
            _mergeSort(&data, mid + 1, high)
            _merge(&data, low, mid, high)
        }
    }
    func _merge(_ data: inout [[Int]], _ low: Int, _ mid: Int, _ high: Int) {
        var tmp = Array.init(repeating: [0, 0], count: high - low + 1)
        var i = low
        var j = mid + 1
        var k = 0
        while i <= mid && j <= high {
            if _distance(data[i]) < _distance(data[j]) {
                tmp[k] = data[i]
                i += 1
            } else {
                tmp[k] = data[j]
                j += 1
            }
            k += 1
        }
        while i <= mid {
            tmp[k] = data[i]
            i += 1
            k += 1
        }
        while j <= high {
            tmp[k] = data[j]
            j += 1
            k += 1
        }
        for i in 0..<k {
            data[i + low] = tmp[i]
        }
    }
    func _distance(_ data: [Int]) -> Float {
        return sqrtf(powf(Float(data[0]), 2) + powf(Float(data[1]), 2))
    }
    var points = points
    _mergeSort(&points, 0, points.count - 1)
    return Array(points[0..<K])
}
