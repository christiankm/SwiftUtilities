//
//  PercentageClamped.swift
//  
//
//  Created by Christian Mitteldorf on 18/07/2021.
//

import Foundation

@propertyWrapper
public struct PercentageClamped<Value: Comparable> {

    public var value: Value
    public let range: ClosedRange<Value> = 0.0 ... 1.0 as! ClosedRange<Value>

    public init(wrappedValue: Value) {
        self.value = min(max(range.lowerBound, wrappedValue), range.upperBound)
    }

    public var wrappedValue: Value {
        get {
            value
        }
        set {
            value = min(max(range.lowerBound, newValue), range.upperBound)
        }
    }
}
