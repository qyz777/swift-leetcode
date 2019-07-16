//
//  240.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/16.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 因为行是升序、列也是升序，所以可以从第一行的最后一个元素开始找
 如果元素比target大，那么说明就要左移(减小趋势)
 如果元素比target小，说明要往下移(增大趋势)
 所以这里用i和j分别在一个矩阵中移动选取元素
 
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else {
        return false
    }
    var i = 0
    var j = matrix[0].count - 1
    while i < matrix.count && j >= 0 {
        if matrix[i][j] == target {
            return true
        } else if matrix[i][j] > target {
            j -= 1
        } else if matrix[i][j] < target {
            i += 1
        }
    }
    return false
}
