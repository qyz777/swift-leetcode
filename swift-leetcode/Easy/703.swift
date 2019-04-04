//
//  703.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/4.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

class KthLargest {
    
    private var nums: [Int] = []
    private var k: Int = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums.sorted(by: {
            return $0 > $1
        })
    }
    
    func add(_ val: Int) -> Int {
        if nums.count == 0 {
            nums.append(val)
            return val
        }
        var index = 0
        for i in 0..<nums.count {
            if nums[i] > val {
                index += 1
            } else {
                break
            }
        }
        nums.insert(val, at: index)
        guard k <= nums.count else {
            return nums.last!
        }
        return nums[k - 1]
    }
}
