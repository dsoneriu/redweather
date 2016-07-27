//
//  GenericNetworkManager.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation
import Alamofire

class GenericNetworkManager {
	
	enum NetworkErrors: ErrorType {
		case NoError
		case GenericNetworkError
		case NetworkUnreachable
	}
	
	let baseUrl = "http://marsweather.ingenology.com/v1/"
	
	var alam = Alamofire.Manager.sharedInstance
	
	var myAlamo : Manager {
		get {
			//ensures the timeout will occur at the same time in all requests
			let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
			configuration.timeoutIntervalForRequest = 15
			configuration.timeoutIntervalForResource = 15
			
			//this ensures if etags are used they are ignored
			//for the moment
			configuration.URLCache = nil
			
			alam = Alamofire.Manager(configuration: configuration)
			
			return alam
		}
	}
}
