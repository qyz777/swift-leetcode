//
//  Stack.swift
//  swift-leetcode
//
//  Created by 戚译中 on 2019/2/21.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

public struct Stack<T> {
    fileprivate var array = [T]()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func push(_ element: T) {
        array.append(element)
    }
    public mutating func pop() -> T? {
        return array.popLast()
    }
    public var top: T? {
        return array.last
    }
}
