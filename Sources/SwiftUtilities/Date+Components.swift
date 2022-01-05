//
//  Date+Components.swift
//  
//
//  Created by Christian Mitteldorf on 07/11/2021.
//

import Foundation

public typealias Month = Int
public typealias Quarter = Int
public typealias Year = Int

extension Date {

    private static let calendar = Calendar.current

    public var monthComponent: Month {
        Self.calendar.component(.month, from: self)
    }

    public var yearComponent: Year {
        Self.calendar.component(.year, from: self)
    }

    public var monthYearComponents: DateComponents {
        Self.calendar.dateComponents([.month, .year], from: self)
    }
    
    /// Initialize a `Date` with a specific day, month and year using the systems current calendar.
    /// returns: A new `Date` with the given components, or nil if the date could not be computed.
    public init?(day: Int, month: Int, year: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = .current

        guard let date = Calendar.current.date(from: dateComponents) else { return nil }

        self = date
    }
}
