//
//  378.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 处理成小顶堆，每次删除堆顶直到k，第k次的删除的堆顶就是答案
 
 删除堆顶操作:
 1. 将堆中最后一个元素代替堆顶元素
 2. 将将堆中最后一个元素删除(原堆顶)
 3. 向下调整(shiftDown)
 
 */

func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    var heap: [Int] = []
    for row in matrix {
        for e in row {
            heap.append(e)
        }
    }
    //向下调整
    func _shiftDown(_ array: inout [Int], _ n: Int, _ i: Int) {
        var i = i
        while i < n {
            var p = i
            if i * 2 + 1 < n && array[p] > array[i * 2 + 1] {
                p = i * 2 + 1
            }
            if i * 2 + 2 < n && array[p] > array[i * 2 + 2] {
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
    //自底向上堆化
    for i in (0..<(heap.count) / 2).reversed() {
        _shiftDown(&heap, heap.count, i)
    }
    var res = 0
    for _ in 0..<k {
        //每次删除堆顶
        heap.swapAt(0, heap.count - 1)
        res = heap.removeLast()
        _shiftDown(&heap, heap.count, 0)
    }
    return res
}
