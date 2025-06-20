//
//  Array+Chunked.swift
//  SwiftUtilities
//
//  Created by Christian Mitteldorf on 26/04/2024.
//

import Foundation

extension Array {

    public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
