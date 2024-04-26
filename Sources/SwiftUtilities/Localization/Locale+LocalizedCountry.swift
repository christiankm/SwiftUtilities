//
//  Locale+LocalizedCountry.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension Locale {

    /// Returns the localized country name in the current locales language for a given region code.
    /// - Parameter code: A region code.
    /// - Returns: The localized name of the regions country, or nil if the region code is not correct.
    public func localizedCountry(forRegionCode code: String) -> String? {
        localizedString(forRegionCode: code)
    }
}
