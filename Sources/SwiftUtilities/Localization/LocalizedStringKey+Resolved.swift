//
//  LocalizedStringKey+Resolved.swift
//  SwiftUtilities
//
//  Created by Christian Mitteldorf on 15/06/2021.
//  Copyright © 2021 Mitteldorf. All rights reserved.
//

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
extension LocalizedStringKey {

    /// Return localized value of LocalizedStringKey using a given `Locale`.
    public func localizedString(using locale: Locale = .current) -> String {
        guard let stringKey = Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String else { return "" }

        let language = locale.languageCode
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else { return stringKey }
        guard let bundle = Bundle(path: path) else { return stringKey }

        return NSLocalizedString(stringKey, bundle: bundle, comment: "")
    }

    public func localizedString(using locale: Locale = .current, value: Int? = nil) -> String {
        let localizedString = localizedString(using: locale)

        if let value = value {
            return String(format: NSLocalizedString(localizedString, comment: ""), value)
        } else {
            return localizedString
        }
    }

    /// Return localized value of LocalizedStringKey using a given `Locale`.
    public func localizedString(values: CVarArg..., using locale: Locale = .current) -> String {
        let localizedString = localizedString(using: locale)

        return String(format: NSLocalizedString(localizedString, comment: ""), values)
    }

    /// Return localized value of LocalizedStringKey.
    public var resolved: String {
        localizedString()
    }
}
