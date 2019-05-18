//
//  784.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/18.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️⭐️
 
 难点:
 需要考虑到小写字母可能情况为转化为大写字母或者保持小写字母；
 大写字母可能的情况为转化为小写字母或者保持大写字母
 
 基本的回溯问题，列好回溯问题的模板即可解决
 
 */

func letterCasePermutation(_ S: String) -> [String] {
    guard !S.isEmpty else {
        return []
    }
    var res: [String] = []
    func _dfs(_ res: inout [String], _ path: String, _ start: Int) {
        if S.count == path.count {
            res.append(path)
        } else {
            var path = path
            for i in start..<S.count {
                let c = String(S[S.index(S.startIndex, offsetBy: i)..<S.index(S.startIndex, offsetBy: i + 1)])
                if c >= "a" && c <= "z" {
                    path += c.uppercased()
                    _dfs(&res, path, i + 1)
                    path.removeLast()
                } else if c >= "A" && c <= "Z" {
                    path += c.lowercased()
                    _dfs(&res, path, i + 1)
                    path.removeLast()
                }
                path += c
                _dfs(&res, path, i + 1)
                path.removeLast()
            }
        }
    }
    _dfs(&res, "", 0)
    return res
}
