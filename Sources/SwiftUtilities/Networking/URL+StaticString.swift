//
//  URL+StaticString.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension URL {

    public init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
