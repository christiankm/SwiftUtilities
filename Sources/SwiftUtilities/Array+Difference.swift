//
//  Array+Difference.swift
//
//
//  Created by Christian Mitteldorf on 20/03/2021.
//

import Foundation

extension Array where Element: Hashable {

    public func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)

        return Array(thisSet.symmetricDifference(otherSet))
    }
}
