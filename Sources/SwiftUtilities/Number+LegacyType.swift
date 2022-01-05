//
//  Number+LegacyType.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension Decimal {

    public var asDecimalNumber: NSDecimalNumber {
        self as NSDecimalNumber
    }
}

extension Int {
    public var asNumber: NSNumber {
        self as NSNumber
    }
}

extension Double {
    public var asNumber: NSNumber {
        self as NSNumber
    }
}
