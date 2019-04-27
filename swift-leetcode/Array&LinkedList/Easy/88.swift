//
//  88.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/4/27.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m + n - 1
    var j = m - 1
    var k = n - 1
    while j >= 0 && k >= 0 {
        if nums1[j] > nums2[k] {
            nums1[i] = nums1[j]
            j -= 1
        } else if nums1[j] <= nums2[k] {
            nums1[i] = nums2[k]
            k -= 1
        }
        i -= 1
    }
    while k >= 0 {
        nums1[i] = nums2[k]
        k -= 1
        i -= 1
    }
}
