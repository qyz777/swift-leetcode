//
//  74.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/23.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 LeetCode出bug了？，这题跟240一模一样诶
 反正就是从第一行最后一列开始往左走或往下走，比当前小就往左，比当前大就往右
 
 */

func array_searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0 else {
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
