//
//  Trie.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/6.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

class Trie {
    
    private var isAWord = false
    private var children: [Character: Trie] = [:]
    private var val: Character?
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        guard word.count > 0 else {
            return
        }
        var tempWord = word
        let char = tempWord.removeFirst()
        var node: Trie?
        if children[char] == nil {
            node = Trie()
            node!.val = char
            children[char] = node
        }
        node = children[char]!
        if tempWord.count == 0 {
            node?.isAWord = true
        } else {
            node?.insert(tempWord)
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        if isAWord && word.count == 0 {
            return true
        }
        guard word.count > 0 else {
            return false
        }
        var tempWord = word
        let char = tempWord.removeFirst()
        var node: Trie?
        if children[char] == nil {
            return false
        } else {
            node = children[char]!
        }
        return node!.search(tempWord)
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard prefix.count > 0 else {
            return false
        }
        var tempWord = prefix
        let char = tempWord.removeFirst()
        if children[char] == nil {
            return false
        } else {
            let node: Trie = children[char]!
            if tempWord.count == 0 {
                return true
            }
            return node.startsWith(tempWord)
        }
    }
}
