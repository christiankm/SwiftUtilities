//
//  String+Empty.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension Optional where Wrapped == String {

    public var orEmpty: String {
        self ?? ""
    }

    public var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }

    public func or(_ string: String) -> String {
        self ?? string
    }
}
