//
//  349.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var info: [Int: Int] = [:]
    for num in nums1 {
        info[num] = 1
    }
    var res: [Int] = []
    for num in nums2 {
        if info[num] != nil {
            //用过要记得删掉
            info[num] = nil
            res.append(num)
        }
    }
    return res
}
