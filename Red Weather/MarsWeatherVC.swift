//
//  ViewController.swift
//  Red Weather
//
//  Created by razvan soneriu on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import UIKit

class MarsWeatherVC: MainViewController {
	
	@IBOutlet weak var seasonLabel: UILabel!
	@IBOutlet weak var weatherConditionLabel: UILabel!
	@IBOutlet weak var temperatureRangeLabel: UILabel!
	@IBOutlet weak var sunriseLabel: UILabel!
	@IBOutlet weak var sunsetLabel: UILabel!
	@IBOutlet weak var windSpeedLabel: UILabel!
	@IBOutlet weak var windDirectionLabel: UILabel!
	@IBOutlet weak var pressureLabel: UILabel!
	@IBOutlet weak var pressureChangeLabel: UILabel!
	@IBOutlet weak var mainWrapper: UIView!
	@IBOutlet weak var temperatureChoice: UISegmentedControl!
	
	@IBAction func scaleChanged(sender: UISegmentedControl) {
		if let newScale = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex) {
			StaticResources.userTemperatureScale = newScale
			myBrain.setTemperatureRangeBasedOnCurrentScale()
		}
	}
	
	var myBrain: MarsWeatherBrain!
	
	//MARK: - View lifecycle
	override func viewDidLoad() {
		mainWrapper.alpha = 0
		temperatureChoice.setTitle(StaticResources.celsius, forSegmentAtIndex: 0)
		temperatureChoice.setTitle(StaticResources.farenheit, forSegmentAtIndex: 1)
		
		temperatureChoice.selectedSegmentIndex = StaticResources.userTemperatureScale == StaticResources.celsius ? 0 : 1
		
		myBrain = MarsWeatherBrain(view: self)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(genericNetworkErrorMessage), name: "networkMessage", object: nil)
	}
	
	deinit {
		myBrain = nil
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
	
	//MARK: - Handle notification
	@objc private func genericNetworkErrorMessage(info:NSNotification) {
		if let networkResponse = info.userInfo?["networkResponse"] as? Int {
			if networkResponse == GenericNetworkManager.NetworkErrors.GenericNetworkError.hashValue {
				showAlertWithMessage(StaticResources.genericNetworkErrorMessage)
			}
			else if networkResponse == GenericNetworkManager.NetworkErrors.NoError.hashValue {
				myBrain.bindWeatherData()
			}
			else if networkResponse == GenericNetworkManager.NetworkErrors.NetworkUnreachable.hashValue {
				showAlertWithMessage(StaticResources.networkUnreachableMessage)
			}
		}
	}
	
	//MARK: - Update labels data
	func setSeasonText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.seasonLabel.text = text
		}
	}
	
	func setWeatherConditionText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.weatherConditionLabel.text = text
		}
	}
	
	func setTemperatureText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.temperatureRangeLabel.text = text
		}
	}
	
	func setSunriseText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.sunriseLabel.text = text
		}
	}
	
	func setSunsetText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.sunsetLabel.text = text
		}
	}
	
	func setWindSpeedText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.windSpeedLabel.text = text
		}
	}
	
	func setWindDirectionText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.windDirectionLabel.text = text
		}
	}
	
	func setPressureText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.pressureLabel.text = text
		}
	}
	
	func setPressureChangeText(text:String) {
		dispatch_async(dispatch_get_main_queue()) {
			self.pressureChangeLabel.text = text
		}
	}
	
	func showDataWrapper() {
		UIView.animateWithDuration(0.5) {
			self.mainWrapper.alpha = 1
		}
	}
}

