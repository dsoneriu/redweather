//
//  Extensions.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//
import Foundation

extension String {
	
	func beautifyDate() -> String {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		
		guard let date = dateFormatter.dateFromString(self) else {
			return StaticResources.noStringResultAvailable
		}
		
		let calendar = NSCalendar.currentCalendar()
		let comp = calendar.components([.Hour, .Minute, .Day, .Month, .Year], fromDate: date)
		
		return "\(comp.hour):\(comp.minute) on \(comp.day)-\(comp.month)"
		
	}

}