//
//  274.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/20.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 降序排列，计数得到值跟数量一样大(或值比数量大)为止
 
 */

func hIndex(_ citations: [Int]) -> Int {
    var citations = citations.sorted(by: {
        return $1 < $0
    })
    var res = 0 //计数
    for i in 0..<citations.count {
        if citations[i] > res {
            res += 1
        } else {
            break
        }
    }
    return res
}
