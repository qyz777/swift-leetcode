//
//  ArraySort.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/30.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    
    /// 归并排序
    /// 平均时间复杂度: O(nlogn)
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
    ///  平均时间复杂度: O(nlogn)
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
    
    
    /// 堆排序(大顶堆->升序)
    /// 平均时间复杂度: O(nlogn)
    /// 升序采用大顶堆 降序采用小顶堆
    /// 1. 从下往上原地建堆
    /// 2. 从下往上把当前最后一个叶子节点与堆顶交换
    /// 3. 重新原地调整成大顶堆
    /// 4. 重复2 - 3的过程
    /// 堆的常用公式: left = 2 * i + 1 right = 2 * i + 2 (i为下标)
    /// 最后一个非叶子节点为 向下取整(array.count / 2) - 1
    mutating func heapSort() {
        func _buildHeap(_ array: inout [Element]) {
            //从最后一个非叶子节点向上原地调整堆
            for i in (0...(array.count / 2) - 1).reversed() {
                _heapify(&array, array.count, i)
            }
        }
        func _heapify(_ array: inout [Element], _ n: Int, _ i: Int) {
            var i = i
            while true {
                var p = i
                //左节点是否大于跟节点
                if i * 2 + 1 < n && array[i] < array[i * 2 + 1] {
                    p = i * 2 + 1
                }
                //右节点是否大于跟节点
                if i * 2 + 2 < n && array[p] < array[i * 2 + 2] {
                    p = i * 2 + 2
                }
                //若左右都比跟小就退出循环
                if p == i {
                    break
                }
                //左或右与根节点交换
                array.swapAt(p, i)
                //去看子堆是否需要调整
                i = p
            }
        }
        _buildHeap(&self)
        for i in (0..<self.count).reversed() {
            swapAt(0, i)
            _heapify(&self, i, 0)
        }
    }
    
}
