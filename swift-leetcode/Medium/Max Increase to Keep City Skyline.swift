//
//  Max Increase to Keep City Skyline.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
    var maxIncreased = 0
    var leftMaxHeight: [Int] = []
    var topMaxHeight: [Int] = []
    for _ in 0..<grid.count {
        leftMaxHeight.append(0)
        topMaxHeight.append(0)
    }
    for i in 0..<grid.count {
        let g = grid[i]
        for j in 0..<grid.count {
            topMaxHeight[j] = max(g[j], topMaxHeight[j])
        }
        
        for j in g {
            leftMaxHeight[i] = max(j, leftMaxHeight[i])
        }
    }
    for i in 0..<grid.count {
        let g = grid[i]
        for j in 0..<g.count {
            maxIncreased += min(topMaxHeight[j], leftMaxHeight[i]) - g[j]
        }
    }
    
    return maxIncreased
}
