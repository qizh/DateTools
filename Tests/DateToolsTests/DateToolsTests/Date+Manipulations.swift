//
//  Date+Manipulations.swift
//  DateToolsTests
//
//  Created by Grayson Webster on 9/28/16.
//  Copyright © 2016 Matthew York. All rights reserved.
//

import Foundation

public extension Date {
    
    // MARK: - StartOf
    
    mutating func start(of component: Component) {
        if component == .second {
            self.second(self.second)
        }
        else if component == .minute {
            self.second(0)
        } else if component == .hour {
            self.second(0)
            self.minute(0)
        } else if component == .day {
            self.second(0)
            self.minute(0)
            self.hour(0)
        } else if component == .month {
            self.second(0)
            self.minute(0)
            self.hour(0)
            self.day(1)
        } else if component == .year {
            self.second(0)
            self.minute(0)
            self.hour(0)
            self.day(1)
            self.month(1)
        }
    }
    
    mutating func end(of component: Component) {
        if component == .second {
            self.second(self.second + 1)
            self = self - 0.001
        }
        else if component == .minute {
            self.second(60)
            self = self - 0.001
        } else if component == .hour {
            self.second(60)
            self = self - 0.001
            self.minute(59)
        } else if component == .day {
            self.second(60)
            self = self - 0.001
            self.minute(59)
            self.hour(23)
        } else if component == .month {
            self.second(60)
            self = self - 0.001
            self.minute(59)
            self.hour(23)
            self.day(daysInMonth(date: self))
        } else if component == .year {
            self.second(60)
            self = self - 0.001
            self.minute(59)
            self.hour(23)
            self.month(12)
            self.day(31)
        }
    }
    
    internal func daysInMonth(date: Date) -> Int {
        let month = date.month
        if month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 {
            // 31 day month
            return 31
        } else if month == 2 && date.isInLeapYear {
            // February with leap year
            return 29
        } else if month == 2 && !date.isInLeapYear {
            // February without leap year
            return 28
        } else {
            // 30 day month
            return 30
        }
    }
    
    
    // MARK: - Addition / Subtractions
    
    func add(_ timeChunk: TimeChunk) -> Date {
        let calendar = Calendar.autoupdatingCurrent
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.year! += timeChunk.years
        components.month! += timeChunk.months
        components.day! += timeChunk.days + (timeChunk.weeks*7)
        components.hour! += timeChunk.hours
        components.minute! += timeChunk.minutes
        components.second! += timeChunk.seconds
        return calendar.date(from: components)!
    }
    
    func subtract(_ timeChunk: TimeChunk) -> Date {
        let calendar = Calendar.autoupdatingCurrent
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.year! -= timeChunk.years
        components.month! -= timeChunk.months
        components.day! -= timeChunk.days - (timeChunk.weeks*7)
        components.hour! -= timeChunk.hours
        components.minute! -= timeChunk.minutes
        components.second! -= timeChunk.seconds
        return calendar.date(from: components)!
    }
    
    
    // MARK: - Operator Overloads
    
    static func +(leftAddend: Date, rightAddend: TimeChunk) -> Date {
        return leftAddend.add(rightAddend)
    }
    
    static func -(minuend: Date, subtrahend: TimeChunk) -> Date {
        return minuend.subtract(subtrahend)
    }
    
    static func +(leftAddend: Date, rightAddend: Int) -> Date {
        return leftAddend.addingTimeInterval((TimeInterval(rightAddend)))
    }
    
    static func -(minuend: Date, subtrahend: Int) -> Date {
        return minuend.addingTimeInterval(-(TimeInterval(subtrahend)))
    }

}