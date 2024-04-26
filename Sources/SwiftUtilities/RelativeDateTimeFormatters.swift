//
//  RelativeDateTimeFormatters.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

@available(macOS 10.15, iOS 13.0, *)
extension RelativeDateTimeFormatter {

    public class func full(_ date: Date, relativeTo: Date = .now) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: relativeTo)
    }
}
