//
//  DateFormatters.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension DateFormatter {

    /// Format a date with medium date style, and no time style.
    /// - Parameter date: A date to format.
    /// - Parameter locale: The locale to use for formatting. Defaults to `.autoupdatingCurrent`.
    /// - Returns: A string representation of date using the medium date style and no time.
    public class func mediumNoTime(_ date: Date, locale: Locale = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }

    /// Format a date with long date style, and no time style.
    /// - Parameter date: A date to format.
    /// - Parameter locale: The locale to use for formatting. Defaults to `.autoupdatingCurrent`.
    /// - Returns: A string representation of date using the long date style and no time.
    public class func longNoTime(_ date: Date, locale: Locale = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
