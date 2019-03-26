//
//  77.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/3/26.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var list: [[Int]] = []
    getCombine(&list, tempList: [], start: 1, n: n, k: k)
    return list
}

fileprivate func getCombine(_ list: inout [[Int]], tempList: [Int], start: Int, n: Int, k: Int) {
    if tempList.count == k {
        list.append(tempList)
    }
    guard start <= n else {
        return
    }
    var t = tempList
    for i in start...n {
        t.append(i)
        getCombine(&list, tempList: t, start: i + 1, n: n, k: k)
        t.remove(at: t.count - 1)
    }
}
