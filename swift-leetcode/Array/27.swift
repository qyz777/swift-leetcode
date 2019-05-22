//
//  27.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = 0
    for n in nums {
        if n != val {
            i += 1
        } else {
            nums.remove(at: i)
        }
    }
    return nums.count
}
