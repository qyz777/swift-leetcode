//
//  963.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/8/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 先根据A的值大小排序，获得排序后的带原来下标的数组，这里用元组数组表示[(值, 下标)]
 这个时候只需要从头遍历取下标之差的最大值即可
 
 */

func maxWidthRamp(_ A: [Int]) -> Int {
    var array: [(Int, Int)] = []
    for i in 0..<A.count {
        array.append((A[i], i))
    }
    array.sort(by: {
        return $0 < $1
    })
    var res = 0
    var index = A.count
    for a in array {
        res = max(res, a.1 - index)
        //获得最小下标
        index = min(index, a.1)
    }
    return res
}
