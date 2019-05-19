//
//  621.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/19.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 Review Level: ⭐️⭐️
 
 难点:
 理解题目任务调度隐藏的意思，只要比较最多出现的任务以及所有任务的长度即可
 
 参考https://blog.csdn.net/qq_43322057/article/details/84864283
 
 */

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var info: [Character: Int] = [:]
    var maxCount = 1
    for task in tasks {
        if info[task] == nil {
            info[task] = 1
        } else {
            info[task] = info[task]! + 1
            maxCount = max(maxCount, info[task]!)
        }
    }
    var num = 0
    for (_ ,v) in info {
        if v == maxCount {
            num += 1
        }
    }
    //n+1是最多出现任务的耗时比如说有3个A那个两个A耗时是n + 1 * (A的次数 - 1) + 一个A
    return (maxCount - 1) * (n + 1) + num > tasks.count ? (maxCount - 1) * (n + 1) + num : tasks.count
}
