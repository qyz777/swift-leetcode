//
//  448.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/6/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
        return []
    }
    var res: [Int] = []
    var info: [Int: Int] = [:]
    for i in 1...nums.count {
        info[i] = 1
    }
    for n in nums {
        if info[n] != nil {
            info.removeValue(forKey: n)
        }
    }
    for (k, _) in info {
        res.append(k)
    }
    return res
}
