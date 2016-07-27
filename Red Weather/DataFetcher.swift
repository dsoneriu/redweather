//
//  DataFetcher.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataFetcher: GenericNetworkManager {
	
	static var sharedInstance = DataFetcher()
	
	func retrieveLatestMarsWeatherData(completion:(error:GenericNetworkManager.NetworkErrors, weatherData:MarsWeatherData?) -> Void) {
		
		let request = baseUrl + "latest/"
		myAlamo.request(.GET, request, parameters: nil, encoding: .JSON, headers: nil).responseJSON {
			resp in
			
			guard !resp.result.isFailure else {
				completion(error: .NetworkUnreachable, weatherData: nil)
				return
			}
			
			guard let response = resp.response where response.statusCode == 200, let data = resp.data, json = JSON(data: data).dictionary, marsData = json["report"]?.dictionary else {
				completion(error: .GenericNetworkError, weatherData: nil)
				return
			}
			
						
			//build today's data
			var minTemperature = [String:Double]()
			minTemperature[StaticResources.celsius] = marsData["min_temp"]?.double
			minTemperature[StaticResources.farenheit] = marsData["min_temp_fahrenheit"]?.double
			
			var maxTemperature = [String:Double]()
			maxTemperature[StaticResources.celsius] = marsData["max_temp"]?.double
			maxTemperature[StaticResources.farenheit] = marsData["max_temp_fahrenheit"]?.double
			
			let season = marsData["season"]?.string ?? StaticResources.noStringResultAvailable
			let sunset = marsData["sunset"]?.string ?? StaticResources.noStringResultAvailable
			let sunrise = marsData["sunrise"]?.string ?? StaticResources.noStringResultAvailable
			
			let windDirection = marsData["wind_direction"]?.string ?? StaticResources.noStringResultAvailable
			let pressure = marsData["pressure"]?.string ?? StaticResources.noStringResultAvailable
			let pressureChange = marsData["pressure_string"]?.string ?? StaticResources.noStringResultAvailable
			let windSpeed = marsData["wind_speed"]?.string ?? StaticResources.noStringResultAvailable
			let weatherCondition = marsData["atmo_opacity"]?.string ?? StaticResources.noStringResultAvailable
			
			
			let mData = MarsWeatherData(
				season: season,
				minTemperature: minTemperature,
				maxTemperature: maxTemperature,
				sunset: sunset,
				sunrise: sunrise,
				windDirection: windDirection,
				windSpeed: windSpeed,
				pressure: pressure,
				pressureChange: pressureChange,
				weatherCondition: weatherCondition
			)
			
			completion(error: .NoError, weatherData: mData)
		}
	}

}

