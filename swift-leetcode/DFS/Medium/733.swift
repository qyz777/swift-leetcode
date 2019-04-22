//
//  733.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    guard image.count > 0 else {
        return image
    }
    var image = image
    var visited: [String: Int] = [:]
    let originColor = image[sr][sc]
    func _DFS(_ image: inout [[Int]], _ nr: Int, _ nc: Int, _ visited: inout [String: Int]) {
        image[nr][nc] = newColor
        let mX = [-1, 1, 0, 0]
        let mY = [0, 0, -1, 1]
        for i in 0..<4 {
            let nextX = nr + mX[i]
            let nextY = nc + mY[i]
            if nextX >= 0 && nextX < image.count && nextY >= 0 && nextY < image[0].count {
                if visited["\(nextX),\(nextY)"] == nil && image[nextX][nextY] == originColor {
                    visited["\(nextX),\(nextY)"] = 1
                    _DFS(&image, nextX, nextY, &visited)
                }
            }
        }
    }
    _DFS(&image, sr, sc, &visited)
    return image
}
