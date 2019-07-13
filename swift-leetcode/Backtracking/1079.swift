//
//  1079.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/13.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 类似于全排列问题，很正常的回溯，用回溯模板一怼就完事了
 
 */

func numTilePossibilities(_ tiles: String) -> Int {
    guard !tiles.isEmpty else {
        return 0
    }
    func _bt(_ res: inout [String: Int], _ path: inout String, _ tileArray: inout [Character]) {
        if !path.isEmpty {
            res[path] = 1
        }
        for i in 0..<tileArray.count {
            let char = tileArray[i]
            tileArray.remove(at: i)
            path += String(char)
            _bt(&res, &path, &tileArray)
            path.removeLast()
            tileArray.insert(char, at: i)
        }
    }
    var res: [String: Int] = [:]
    var tileArray: [Character] = Array(tiles)
    var path: String = ""
    _bt(&res, &path, &tileArray)
    return res.count
}
