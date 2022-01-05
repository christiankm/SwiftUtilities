//
//  DateFormatters.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

extension DateFormatter {

    /// - returns: A string representation of date using the medium date style and no time.
    /// - Parameter date: <#date description#>
    ///


    /// <#Description#>
    /// - Parameter date: <#date description#>
    /// - Returns: <#description#>
    public class func mediumNoTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }

    /// - returns: A string representation of date using the long date style and no time.
    /// - Parameter date: <#date description#>


    /// <#Description#>
    /// - Parameter date: <#date description#>
    /// - Returns: <#description#>
    public class func longNoTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}
