//
//  WeatherData.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation

class MarsWeatherData {
	
	var season: String
	
	var minTemperature: [String: Double]
	var maxTemperature: [String:Double]
	
	var sunset: String
	var sunrise: String
	
	var windDirection: String
	var windSpeed: String
	var pressure: String
	var pressureChange: String
	var weatherCondition: String
	
	init(season:String, minTemperature:[String:Double], maxTemperature:[String:Double], sunset:String, sunrise:String, windDirection:String, windSpeed:String, pressure:String, pressureChange:String, weatherCondition:String) {
		
		self.season = season
		self.minTemperature = minTemperature
		self.maxTemperature = maxTemperature
		
		//drop a little beautification
		self.sunset = sunset != StaticResources.noStringResultAvailable ? sunset.beautifyDate() : sunset
		self.sunrise = sunrise != StaticResources.noStringResultAvailable ? sunrise.beautifyDate() : sunrise
		
		self.windDirection = windDirection
		self.windSpeed = windSpeed
		
		self.pressure = pressure
		self.pressureChange = pressureChange
		
		self.weatherCondition = weatherCondition
	}
	
}