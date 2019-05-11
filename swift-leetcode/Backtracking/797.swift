//
//  All Paths From Source to Target.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/28.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var array: [[Int]] = []
    var path = [0]
    findPath(with: graph, index: 0, result: &array, path: &path)
    return array
}

func findPath(with graph:[[Int]], index: Int, result: inout [[Int]], path: inout [Int]) {
    guard index != graph.count - 1 else {
        result.append(path)
        return
    }
    for i in graph[index] {
        var tempPath = path + [i]
        findPath(with: graph, index: i, result: &result, path: &tempPath)
    }
}
