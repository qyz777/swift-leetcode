//
//  860.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/1.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func lemonadeChange(_ bills: [Int]) -> Bool {
    var five = 0
    var ten = 0
    for bill in bills {
        if bill == 5 {
            five += 1
        } else if bill == 10 {
            if five == 0 {
                return false
            }
            five -= 1
            ten += 1
        } else if bill == 20 {
            if five > 0 && ten > 0 {
                five -= 1
                ten -= 1
            } else if five > 2 {
                five -= 3
            } else {
                return false
            }
        }
    }
    return true
}
