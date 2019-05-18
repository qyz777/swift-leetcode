//
//  417.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 遍历矩阵的时候再dfs会超时，所以需要提前设置好两个矩阵（一个太平洋，一个大西洋）求交集
 
 这个代码我自己超时了，这是参考评论区的代码，以下是他的思路
 
 这道题我们转换思路，我们从给定数组的最外面一周索引出发, 创建两个pacific数组和atlantic数组来标记
 太平洋的水和大西洋的水能不能到达这个岛屿上的某个坐标点。
 在进行dfs的时候,把按照升序能够到达的所有点都标记为可达.
 最终的结果只需要判断两个标记数组中的某个坐标是否都为true,若都为true,则两大洋都可到达这个坐标.
 
 */

func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
    guard matrix.count > 0 else {
        return []
    }
    func _dfs(_ sea: inout [[Bool]], _ x: Int, _ y: Int) {
        if sea[x][y] {
            return
        }
        sea[x][y] = true
        //四个方向
        let X = [-1, 1, 0, 0]
        let Y = [0, 0, 1, -1]
        for i in 0..<4 {
            if x + X[i] >= 0 &&
                x + X[i] < matrix.count &&
                y + Y[i] >= 0 &&
                y + Y[i] < matrix.first!.count &&
                //注意这里是>=
                matrix[x + X[i]][y + Y[i]] >= matrix[x][y] {
                _dfs(&sea, x + X[i], y + Y[i])
            }
        }
    }
    var pacific = Array.init(repeating: Array.init(repeating: false, count: matrix.first!.count), count: matrix.count)
    var atlantic = Array.init(repeating: Array.init(repeating: false, count: matrix.first!.count), count: matrix.count)
    //从四个方向出发，可以到达太平洋或大西洋
    for i in 0..<matrix.first!.count {
        _dfs(&pacific, 0, i)
        _dfs(&atlantic, matrix.count - 1, i)
    }
    for i in 0..<matrix.count {
        _dfs(&pacific, i, 0)
        _dfs(&atlantic, i, matrix.first!.count - 1)
    }
    var res: [[Int]] = []
    for i in 0..<matrix.count {
        for j in 0..<matrix.first!.count {
            //取交集即两个都可以达到
            if pacific[i][j] && atlantic[i][j] {
                res.append([i, j])
            }
        }
    }
    return res
}
