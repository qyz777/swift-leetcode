//
//  75.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/10.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 不是很懂这题要考啥？
 相邻的元素排在一起那么一个快排不就搞定了么...🤷‍♀️
 好吧竟然超时了
 
 那就采用三指针法
 
 */

func sortColors(_ nums: inout [Int]) {
    var low = 0
    var high = nums.count - 1
    var i = 0
    while i <= high {
        if nums[i] == 0 {
            //low的增长即为0的长度增长
            nums.swapAt(i, low)
            low += 1
            i += 1
        } else if nums[i] == 1 {
            //nums[i] == 1就不需要改变位置
            i += 1
        } else if i <= high && nums[i] == 2 {
            //high也同理
            nums.swapAt(i, high)
            high -= 1
        }
    }
}

//func sortColors(_ nums: inout [Int]) {
//    func _quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
//        if low < high {
//            let mid = _sort(&nums, low, high)
//            _quickSort(&nums, 0, mid - 1)
//            _quickSort(&nums, mid + 1, high)
//        }
//    }
//    func _sort(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
//        var p = low
//        for i in low+1...high {
//            if nums[i] < nums[low] {
//                p += 1
//                nums.swapAt(p, i)
//            }
//        }
//        nums.swapAt(low, p)
//        return p
//    }
//    _quickSort(&nums, 0, nums.count - 1)
//}
