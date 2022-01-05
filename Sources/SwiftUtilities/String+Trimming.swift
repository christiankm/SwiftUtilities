//
//  File.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension String {

    public var trimmingWhitespace: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
