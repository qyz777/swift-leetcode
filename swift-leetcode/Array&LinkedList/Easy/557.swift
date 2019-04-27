//
//  557.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func reverseWords(_ s: String) -> String {
    let wordList = s.split(separator: " ")
    var newWordList: [String] = []
    for word in wordList {
        newWordList.append(String(word.reversed()))
    }
    return newWordList.joined(separator: " ")
}
