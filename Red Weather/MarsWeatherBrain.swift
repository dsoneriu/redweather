//
//  MarsWeatherBrain.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation

class MarsWeatherBrain {
	
	weak var myView: MarsWeatherVC?
	
	init(view:MarsWeatherVC) {
		myView = view
	}
	
	func bindWeatherData() {
		guard let data = StaticResources.cachedData, v = myView else {
			return
		}
		
		v.setSeasonText(data.season)
		v.setWeatherConditionText(data.weatherCondition)
		
		v.setSunriseText(data.sunrise)
		v.setSunsetText(data.sunset)
		v.setWindSpeedText(data.windSpeed)
		v.setWindDirectionText(data.windDirection)
		v.setPressureText(data.pressure)
		v.setPressureChangeText(data.pressureChange)
		
		setTemperatureRangeBasedOnCurrentScale()
		
		v.showDataWrapper()
	}
	
	func setTemperatureRangeBasedOnCurrentScale() {
		if let v = myView {
			guard let data = StaticResources.cachedData, minTemperatureForScale = data.minTemperature[StaticResources.userTemperatureScale], maxTemperatureForScale = data.maxTemperature[StaticResources.userTemperatureScale] else {
				v.setTemperatureText(StaticResources.noStringResultAvailable)
				return
			}
			
			//some temperature range magic
			v.setTemperatureText("m:\(minTemperatureForScale) - M:\(maxTemperatureForScale)")
		}
		
	}

}