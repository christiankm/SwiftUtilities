//
//  RelativeDateTimeFormatters.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

import Foundation

@available(macOS 10.15, *)
extension RelativeDateTimeFormatter {

    public class func full(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: .now)
    }
}
