//
//  134.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/7/2.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题归类在贪心算法里，但是我这里使用的是一个时间复杂度为O(n^2)的算法
 
 以下是时间复杂度为O(n)的贪心算法👇
 
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var res = 0
    var run = 0
    var rest = 0 //所有汽油-所有消耗
    for i in 0..<gas.count {
        run += gas[i] - cost[i]
        rest += gas[i] - cost[i]
        //run大于0说明才有可能到下一个加油站
        if run < 0 {
            res = i + 1
            run = 0
        }
    }
    //如果所有汽油都小于所有消耗说明不存在可以循环的情况
    return rest < 0 ? -1 : res
}

*/

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    //从每一个加油站出发
    for i in 0..<gas.count {
        var j = i
        var oil = 0
        //开始循环驾驶这条路
        while true {
            //加油
            oil += gas[j]
            if oil - cost[j] >= 0 {
                //油够了
                oil -= cost[j]
            } else {
                //油不够，没必要循环了
                break
            }
            j += 1
            if j == cost.count {
                //路到头了，回到最开始
                j = 0
            }
            if j == i {
                //回到最开始的加油站，满足条件
                return i
            }
        }
    }
    return -1
}
