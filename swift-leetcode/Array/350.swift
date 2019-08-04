//
//  350.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 基本的哈希表题
 
 */

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var info: [Int: Int] = [:]  //key是num，value是出现的次数
    for num in nums1 {
        if info[num] == nil {
            info[num] = 1
        } else {
            info[num] = info[num]! + 1
        }
    }
    var res: [Int] = []
    for num in nums2 {
        if info[num] != nil {
            res.append(num)
            //每次添加一个就把key对应的数量-1，数量为0时移除这个元素
            let count = info[num]! - 1
            if count == 0 {
                info[num] = nil
            } else {
                info[num] = count
            }
        }
    }
    return res
}
