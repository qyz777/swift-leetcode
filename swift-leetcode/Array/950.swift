//
//  Reveal Cards In Increasing Order.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/22.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    var tempArray = deck
    var array: [Int] = []
    while array.count != deck.count {
        let maxNum = max(from: tempArray)
        array = moveBottomToTop(array)
        array.insert(maxNum, at: 0)
        tempArray = removeNum(maxNum, at: tempArray)
    }
    return array
}

func max(from nums: [Int]) -> Int {
    guard nums.count != 0 else {
        return 0
    }
    var m = nums.first!
    for num in nums {
        m = max(m, num)
    }
    return m
}

func removeNum(_ element: Int, at deck: [Int]) -> [Int] {
    guard deck.count != 0 else {
        return []
    }
    var tempArray = deck
    var index = 0
    for num in tempArray {
        if num == element {
            break;
        }
        index += 1
    }
    if index < tempArray.count {
        tempArray.remove(at: index)
    }
    return tempArray
}

func moveBottomToTop(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    var tempNums = nums
    let temp = tempNums.last!
    tempNums.insert(temp, at: 0)
    tempNums.remove(at: tempNums.count - 1)
    return tempNums
}
