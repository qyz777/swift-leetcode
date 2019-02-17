//
//  Jewels and Stones.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var count = 0
    for j in J {
        for s in S {
            if j == s {
                count += 1
            }
        }
    }
    return count
}
