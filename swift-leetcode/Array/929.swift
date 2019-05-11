//
//  Unique Email Addresses.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func numUniqueEmails(_ emails: [String]) -> Int {
    var array: [String] = []
    for i in 0..<emails.count {
        let email = emails[i]
        let realE = realEmail(from: email)
        array.append(realE)
    }
    var set: Set<String> = []
    for str in array {
        set.insert(str)
    }
    return set.count
}

func realEmail(from email: String) -> String {
    let seg = email.split(separator: "@")
    let name = seg.first!
    let index = name.firstIndex(of: "+") ?? name.endIndex
    let handleName = name[name.startIndex..<index]
    let handleSeg = handleName.split(separator: ".")
    let realName = handleSeg.joined(separator: "")
    return String(realName) + "@" + String(seg.last!)
}
