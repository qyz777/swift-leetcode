//
//  Unique Morse Code Words.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/2/17.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func uniqueMorseRepresentations(_ words: [String]) -> Int {
    let table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    var set: Set<String> = []
    for word in words {
        var str = ""
        var tempWord = word.lowercased()
        for w in tempWord.unicodeScalars {
            let index = w.value
            str += table[Int(index) - 97]
        }
        set.insert(str)
    }
    return set.count
}
