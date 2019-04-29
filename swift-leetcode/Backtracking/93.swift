//
//  93.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/15.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func restoreIpAddresses(_ s: String) -> [String] {
    var res: [String] = []
    func _BT(_ res: inout [String], _ ip: [String], _ s: String) {
        guard ip.count <= 4 else {
            return
        }
        if ip.count == 4 && s.count == 0 {
            res.append(ip.joined(separator: "."))
            return
        }
        for i in 1...4 {
            if i > s.count {
                break
            }
            let number = String(s[s.startIndex..<s.index(s.startIndex, offsetBy: i)])
            if Int(number)! >= 0 && Int(number)! <= 255 && String(Int(number)!) == number {
                var nextIp = ip
                nextIp.append(String(number))
                let nextS = String(s[s.index(s.startIndex, offsetBy: i)..<s.endIndex])
                _BT(&res, nextIp, nextS)
            }
        }
    }
    _BT(&res, [], s)
    return res
}
