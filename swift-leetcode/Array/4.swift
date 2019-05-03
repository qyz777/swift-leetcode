//
//  4.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/5/3.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

// 快排可以O(log(n + m)) 这里是O(n + m)

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    guard !nums1.isEmpty || !nums2.isEmpty else {
        return 0
    }
    var array: [Int] = []
    var nums1 = nums1
    var nums2 = nums2
    while !nums1.isEmpty && !nums2.isEmpty {
        if nums1.first! < nums2.first! {
            array.append(nums1.removeFirst())
        } else if nums2.first! < nums1.first! {
            array.append(nums2.removeFirst())
        } else {
            array.append(nums1.removeFirst())
            array.append(nums2.removeFirst())
        }
    }
    if !nums1.isEmpty {
        array += nums1
    } else if !nums2.isEmpty {
        array += nums2
    }
    let mid = array.count / 2
    if array.count % 2 == 0 {
        return Double(array[mid] + array[mid - 1]) / 2
    } else {
        return Double(array[mid])
    }
}
