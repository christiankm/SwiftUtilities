//
//  Array+FilterOrAll.swift
//
//
//  Created by Christian Mitteldorf on 26/04/2024.
//

import Foundation

extension Array where Element == String {

    public func filterOrAll(_ searchString: String) -> [Element] {
        guard !searchString.isEmpty else { return self }

        return filter { $0.lowercased().contains(searchString.lowercased()) }
    }
}
