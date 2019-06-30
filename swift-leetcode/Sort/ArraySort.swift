//
//  ArraySort.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    
    /// 合并排序
    ///
    /// 1. 将数组从中间分开，对两边分别排序
    /// 2. 将两个有序数组进行合并
    mutating func mergeSort() {
        func _mergeSort(_ array: inout [Element], _ low: Int, _ high: Int) {
            if low < high {
                let mid = (low + high) / 2
                _mergeSort(&array, low, mid)
                _mergeSort(&array, mid + 1, high)
                _merge(&array, low, mid, high)
            }
        }
        func _merge(_ array: inout [Element], _ low: Int, _ mid: Int, _ high: Int) {
            var tmp = Array.init(repeating: 0, count: high - low + 1)
            var i = low
            var j = mid + 1
            var k = 0
            while i <= mid && j <= high {
                if array[i] < array[j] {
                    tmp[k] = array[i]
                    i += 1
                } else {
                    tmp[k] = array[j]
                    j += 1
                }
                k += 1
            }
            while i <= mid {
                tmp[k] = array[i]
                i += 1
                k += 1
            }
            while j <= high {
                tmp[k] = array[j]
                j += 1
                k += 1
            }
            for i in 0..<k {
                array[low + i] = tmp[i]
            }
        }
        _mergeSort(&self, 0, self.count - 1)
    }
    
    
    /// 快速排序
    ///
    /// 1. 从数列中挑出一个基准元素(这里为low)
    /// 2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面(相同的数可以到任一边)
    /// 3. 递归地把小于基准值元素的子数列和大于基准值元素的子数列排序
    mutating func quickSort() {
        func _quickSort(_ array: inout [Element], _ low: Int, _ high: Int) {
            if low < high {
                let p = _sort(&array, low, high)
                _quickSort(&array, low, p - 1)
                _quickSort(&array, p + 1, high)
            }
        }
        func _sort(_ array: inout [Element], _ low: Int, _ high: Int) -> Int {
            var p = low
            for i in low+1...high {
                if array[i] < array[low] {
                    p += 1
                    array.swapAt(p, i)
                }
            }
            array.swapAt(p, low)
            return p
        }
        _quickSort(&self, 0, self.count - 1)
    }
    
}
