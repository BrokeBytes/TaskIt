//
//  Date.swift
//  TaskIt
//
//  Created by James Dykstra on 1/4/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import Foundation
class Date {
    class func from (#year:Int, month: Int, day: Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    class func toString(#date:NSDate) -> String {
        
        var dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        
        return dateString
    }
}
