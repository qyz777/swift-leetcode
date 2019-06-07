//
//  12.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/7.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

/**
 
 这题我这么解出来真是个傻办法，但是我去评论区一看竟然发现大家解法竟然跟我差不多(╯‵□′)╯︵┻━┻
 我这个竟然还是最快的
 
 */

func intToRoman(_ num: Int) -> String {
    var num = num
    var res = ""
    while num > 0 {
        if num >= 1000 {
            res += "M"
            num -= 1000
        } else if 900 <= num && num < 1000 {
            res += "CM"
            num -= 900
        } else if num >= 500 {
            res += "D"
            num -= 500
        } else if 400 <= num && num < 500 {
            res += "CD"
            num -= 400
        } else if num >= 100 {
            res += "C"
            num -= 100
        } else if 90 <= num && num < 100 {
            res += "XC"
            num -= 90
        } else if num >= 50 {
            res += "L"
            num -= 50
        } else if 40 <= num && num < 50 {
            res += "XL"
            num -= 40
        } else if num >= 10 {
            res += "X"
            num -= 10
        } else if 9 <= num && num < 10 {
            res += "IX"
            num -= 9
        } else if num >= 5 {
            res += "V"
            num -= 5
        } else if 4 <= num && num < 5 {
            res += "IV"
            num -= 4
        } else {
            res += "I"
            num -= 1
        }
    }
    return res
}
