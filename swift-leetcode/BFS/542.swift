//
//  542.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/4/9.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
    var queue: [(x: Int, y: Int)] = []
    var m = matrix
    for i in 0..<m.count {
        for j in 0..<m[0].count {
            if m[i][j] == 0 {
                queue.append((x: i, y: j))
            } else {
                m[i][j] = Int.max
            }
        }
    }
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if node.x - 1 >= 0 && m[node.x - 1][node.y] == Int.max {
            queue.append((x: node.x - 1, y: node.y))
            m[node.x - 1][node.y] = m[node.x][node.y] + 1
        }
        if node.x + 1 < m.count && m[node.x + 1][node.y] == Int.max {
            queue.append((x: node.x + 1, y: node.y))
            m[node.x + 1][node.y] = m[node.x][node.y] + 1
        }
        if node.y - 1 >= 0 && m[node.x][node.y - 1] == Int.max {
            queue.append((x: node.x, y: node.y - 1))
            m[node.x][node.y - 1] = m[node.x][node.y] + 1
        }
        if node.y + 1 < m[0].count && m[node.x][node.y + 1] == Int.max {
            queue.append((x: node.x, y: node.y + 1))
            m[node.x][node.y + 1] = m[node.x][node.y] + 1
        }
    }
    return m
}
