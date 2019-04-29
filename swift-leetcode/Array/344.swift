//
//  344.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverseString(_ s: inout [Character]) {
    guard s.count > 0 else {
        return
    }
    for i in 0..<s.count {
        s.insert(s.popLast()!, at: i)
    }
}
