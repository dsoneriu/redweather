//
//  StaticResources.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation

class StaticResources {
	
	static var cachedData: MarsWeatherData?
	
	static let celsius = "C"
	static let farenheit = "F"
	static let noStringResultAvailable = "--"
	
	static let genericNetworkErrorMessage = "There is a problem with your connection, please try again later"
	static let networkUnreachableMessage = "Network unreachable, please try again later "
	
	static var userTemperatureScale : String {
		get {
			let userDefaults = NSUserDefaults.standardUserDefaults()
			if let currentScale = userDefaults.objectForKey("temperatureScale") as? String {
				return currentScale
			}
			return "C"
		}
		set {
			let userDefaults = NSUserDefaults.standardUserDefaults()
			userDefaults.setValue(newValue, forKey: "temperatureScale")
		}
	}
	
}