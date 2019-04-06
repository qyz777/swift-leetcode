//
//  51.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
    func _DFS(_ boards: inout [[Int]], _ chess: [Int], _ n: Int, _ line: Int, _ usedCol: [Int: Int], _ usedPie: [Int: Int], _ usedNa: [Int: Int]) {
        if line >= n {
            boards.append(chess)
            return
        }
        var uc = usedCol
        var up = usedPie
        var un = usedNa
        for col in 0..<n {
            if uc[col] != nil || up[line + col] != nil || un[line - col] != nil {
                continue
            }
            uc[col] = 1
            up[line + col] = 1
            un[line - col] = 1
            _DFS(&boards, chess + [col], n, line + 1, uc, up, un)
            uc.removeValue(forKey: col)
            up.removeValue(forKey: line + col)
            un.removeValue(forKey: line - col)
        }
    }
    func _gen(_ boards: [[Int]], _ n: Int) -> [[String]] {
        var matrix: [[String]] = []
        for b in boards {
            var sb: [String] = []
            for i in 0..<n {
                var lineS = ""
                for j in 0..<n {
                    if j != b[i] {
                        lineS += "."
                    } else {
                        lineS += "Q"
                    }
                }
                sb.append(lineS)
            }
            matrix.append(sb)
        }
        return matrix
    }
    var boards: [[Int]] = []
    _DFS(&boards, [], n, 0, [:], [:], [:])
    return _gen(boards, n)
}
