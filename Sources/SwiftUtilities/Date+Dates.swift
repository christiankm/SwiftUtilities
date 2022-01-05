//
//  Date+Dates.swift
//  
//
//  Created by Christian Mitteldorf on 07/11/2021.
//

import Foundation

extension Date {

    private static let calendar = Calendar.current

    public static let today = Date()
    public static let now = Date()

    public static var distantPastUntilTodayRange: ClosedRange<Date> {
        Date.distantPast ... Date.now
    }

    public static var currentYear: Year {
        today.yearComponent
    }

    public static var firstDayOfThisMonth: Date? {
        Self.calendar.date(from: Date.today.monthYearComponents)
    }

    public static var firstDayOfThisYear: Date? {
        Self.calendar.date(from: Self.calendar.dateComponents([.year], from: .today))
    }
}
